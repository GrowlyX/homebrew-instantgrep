class Instantgrep < Formula
  desc "Fast regex search using trigram indexes"
  homepage "https://github.com/GrowlyX/instantgrep"
  version "0.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/GrowlyX/instantgrep/releases/download/v0.0.4/instantgrep-darwin-arm64.tar.gz"
      sha256 "78a1156c54692933dc2e5be21fafdd5ecf72b364d6f2b937aff543dab06cdf0e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/GrowlyX/instantgrep/releases/download/v0.0.4/instantgrep-linux-amd64.tar.gz"
      sha256 "406e0d2e8f8fabe30dc7640cf79a155ae63a7dff4a9b5b1b87dec3f567c2ae1b"
    end
  end

  on_system :windows do
    on_intel do
      url "https://github.com/GrowlyX/instantgrep/releases/download/v0.0.4/instantgrep-windows-amd64.tar.gz"
      sha256 "b549734a5384eac1d1ed69833550bf14a219684e109f878c4898b4bb355b3b58"
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
