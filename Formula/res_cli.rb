class ResCli < Formula
    desc "CLI to manage ResilientDB and Python SDK instances"
    homepage "https://github.com/gopuman/homebrew-ResCLI"
    url "https://github.com/ResilientApp/ResCLI/archive/refs/tags/nightly.tar.gz"
    sha256 "11f3d8b5c0864a9d22a9c07ebd39beaac54ecd3677e3b6f262c13162e0871d47"
    version "nightly"
  
    depends_on "ruby" => :build
  
    def install
      # Install the gem to the libexec directory
      ENV["GEM_HOME"] = libexec
      system "gem", "install", "--ignore-dependencies", "--no-document", "res_cli-0.1.0.gem"
  
      # Create an executable script that loads the gem
      (bin/"res_cli").write <<~EOS
        #!/bin/bash
        GEM_HOME="#{libexec}" exec "#{libexec}/bin/res_cli" "$@"
      EOS
  
      # Make the script executable
      chmod 0555, bin/"res_cli"
    end
  
    test do
      system "#{bin}/res_cli", "--version"
    end
  end
  