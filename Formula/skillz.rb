class Skillz < Formula
  desc "One TUI for agent skills, plugins & MCP: Claude Code, Codex, omp, OpenCode, Gemini CLI"
  homepage "https://github.com/olekmorawski/skillz"
  url "https://github.com/olekmorawski/skillz/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "b8ebc9edb0c35fe421a83302313c244a93b0804b29e22dac4de168f09c6d3fd8"
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
