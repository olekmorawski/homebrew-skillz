class Skillz < Formula
  desc "One TUI for agent skills & plugins: Claude Code, Codex, omp, OpenCode, Gemini CLI"
  homepage "https://github.com/olekmorawski/skillz"
  url "https://github.com/olekmorawski/skillz/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "220411330f92eee3bbc2c0af41174ae1acbee41e994d4eee933705dcb2d3c019"
  license "MIT"
  head "https://github.com/olekmorawski/skillz.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/skillz --version")
    # empty $HOME: no agents installed, still lists cleanly
    assert_match "NAME", shell_output("#{bin}/skillz list")
  end
end
