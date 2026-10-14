class Skillz < Formula
  desc "One TUI for agent skills, plugins & MCP: Claude Code, Codex, omp, OpenCode, Gemini CLI"
  homepage "https://github.com/olekmorawski/skillz"
  url "https://github.com/olekmorawski/skillz/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "12f5d7bff87fa8221b04431b25fd71f7a17da6b905a6eca6624d4db93782c9c9"
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
