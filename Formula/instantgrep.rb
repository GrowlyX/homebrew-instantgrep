class Instantgrep < Formula
  desc "Fast regex search using trigram indexes"
  homepage "https://github.com/GrowlyX/instantgrep"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/GrowlyX/instantgrep/releases/download/v0.0.1/instantgrep-darwin-arm64.tar.gz"
      sha256 "395582b0b72f0db4722177543e1ccaf71a3ffcad648ba598e1b87ecceb107384"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/GrowlyX/instantgrep/releases/download/v0.0.1/instantgrep-linux-amd64.tar.gz"
      sha256 "6bfedd8a54ad0debf7ef544b584b69910edeb71729a2d1f9f92da61cf971658e"
    end
  end

  depends_on "erlang"

  def install
    bin.install "instantgrep"
    bin.install "instantgrep-bench"
    bin.install_symlink "instantgrep" => "igrep"
    bin.install_symlink "instantgrep" => "ig"
  end

  test do
    assert_match "instantgrep", shell_output("#{bin}/instantgrep --help")
  end
end
