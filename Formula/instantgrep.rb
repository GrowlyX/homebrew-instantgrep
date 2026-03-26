class Instantgrep < Formula
  desc "Fast regex search using trigram indexes"
  homepage "https://github.com/GrowlyX/instantgrep"
  version "0.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/GrowlyX/instantgrep/releases/download/v0.0.7/instantgrep-darwin-arm64.tar.gz"
      sha256 "74e1cbba515923bdd905fc12ab5b692e19ffd08b8c4a7d59c98c919f39d4e048"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/GrowlyX/instantgrep/releases/download/v0.0.7/instantgrep-linux-amd64.tar.gz"
      sha256 "2cb0a94946ab0de1889d4049e8bde3f2628655f07cee6b9157532c7bc3d1d751"
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
