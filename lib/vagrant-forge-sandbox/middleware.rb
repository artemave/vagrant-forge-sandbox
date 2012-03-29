module VagrantForgeSandbox
  class Middleware
    def initialize(app, env)
      @app = app
      @vm  = env[:vm]
    end

    def call(env)
      @vm.ui.info "Provisioning Forge Sandbox..."

      @vm.channel.sudo "[ -d #{upload_path} ] || mkdir #{upload_path}" do |type, data|
        print_to_ui(type, data)
      end

      upload_certs

      @vm.channel.upload("#{local_path}/servers", "#{upload_path}/servers") do |type, data|
        print_to_ui(type, data)
      end

      provision

      @app.call(env)
    end

    private

      def upload_path
        '/tmp/vagrant-forge-sandbox'
      end

      def local_path
        File.expand_path "../../../files", __FILE__
      end

      def provision
        @vm.channel.upload("#{local_path}/provision.sh", "#{upload_path}/provision.sh") do |type, data|
          print_to_ui(type, data)
        end

        @vm.channel.sudo "cd #{upload_path} && chmod +x ./provision.sh && ./provision.sh" do |type, data|
          print_to_ui(type, data)
        end
      end

      def upload_certs
        cert = @vm.config.forge_sandbox.cert

        @vm.channel.upload(cert, "#{upload_path}/cert.pem")

        @vm.channel.sudo "curl -k -o #{upload_path}/ca.pem https://ca.dev.bbc.co.uk/ca.pem" do |type, data|
          print_to_ui(type, data)
        end
      end

      def print_to_ui(type, data)
        if [:stderr, :stdout].include?(type)
          color = type == :stdout ? :green : :red

          @vm.ui.info(data.chomp, :color => color, :prefix => false)
        end
      end
  end
end
