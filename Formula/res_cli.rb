class ResCli < Formula
    desc "CLI to manage ResilientDB and Python SDK instances"
    homepage "https://github.com/gopuman/homebrew-ResCLI"
    url "https://github.com/ResilientApp/ResCLI/archive/refs/tags/nightly.tar.gz"
    sha256 "11f3d8b5c0864a9d22a9c07ebd39beaac54ecd3677e3b6f262c13162e0871d47"
    version "nightly"
  
    depends_on "ruby"
  
    def install
      libexec.install Dir["lib/*"]
      bin.install "lib/res_cli/cli.rb" => "res_cli"
    end
  
    test do
      system "#{bin}/res_cli", "--version"
    end
  end
  