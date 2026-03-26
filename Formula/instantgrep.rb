class Instantgrep < Formula
  desc "Fast regex search using trigram indexes"
  homepage "https://github.com/GrowlyX/instantgrep"
  version "0.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/GrowlyX/instantgrep/releases/download/v0.0.5/instantgrep-darwin-arm64.tar.gz"
      sha256 "82ba07002ab91c336d5e735da4bd0008d594a1fea9d633e0cb0ac04afc699f08"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/GrowlyX/instantgrep/releases/download/v0.0.5/instantgrep-linux-amd64.tar.gz"
      sha256 "3c8476419bc1959754b4f0fb60d4527aef7fa2c07d52200c661802d640f47345"
    end
  end



  depends_on "erlang"

  def install
    bin.install "instantgrep"
    bin.install "instantgrep-daemon"
    bin.install "instantgrep-bench"
    bin.install_symlink "instantgrep" => "igrep"
    bin.install_symlink "instantgrep" => "ig"
  end

  test do
    assert_match "instantgrep", shell_output("#{bin}/instantgrep --help")
  end
end
