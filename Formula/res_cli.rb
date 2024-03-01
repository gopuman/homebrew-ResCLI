class ResCli < Formula
    desc "CLI to manage ResilientDB and Python SDK instances"
    homepage "https://github.com/gopuman/homebrew-ResCLI"
    url "https://github.com/ResilientApp/ResCLI/archive/refs/tags/nightly.tar.gz"
    sha256 "11f3d8b5c0864a9d22a9c07ebd39beaac54ecd3677e3b6f262c13162e0871d47"
    version "nightly"
  
    depends_on "ruby" => :build
  
    def install
      ENV["GEM_HOME"] = libexec
      system "gem", "install", "--ignore-dependencies", "--no-document", "res_cli-0.1.0.gem"
  
      bin.install libexec/"bin/res_cli"
      bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
    end
  
    test do
      system "#{bin}/res_cli", "--version"
    end
  end
  