class Instantgrep < Formula
  desc "Fast regex search using trigram indexes"
  homepage "https://github.com/GrowlyX/instantgrep"
  version "0.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/GrowlyX/instantgrep/releases/download/v0.0.6/instantgrep-darwin-arm64.tar.gz"
      sha256 "91540ee272b47433ec7faa19dbdef89bdfeeb899eb1ee302ccef3796e02dfcb1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/GrowlyX/instantgrep/releases/download/v0.0.6/instantgrep-linux-amd64.tar.gz"
      sha256 "757f620067e879237f3690c646d3a2ba1b0d718a5fe0d37ea1b8175add953f67"
    end
  end

  depends_on "erlang"
  depends_on "pcre2"

  def install
    bin.install "instantgrep"
    bin.install "instantgrep-daemon"
    bin.install "instantgrep-bench"
    bin.install "ig_client"
    # Install the NIF shared library
    (lib/"instantgrep").install Dir["priv/*"]
    bin.install_symlink "instantgrep" => "igrep"
    bin.install_symlink "ig_client" => "ig"
  end

  test do
    assert_match "instantgrep", shell_output("#{bin}/instantgrep --help")
  end
end
