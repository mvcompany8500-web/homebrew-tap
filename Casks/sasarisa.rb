cask "sasarisa" do
  version "0.7.0"
  sha256 "6599b75f0bac5b759d484e81eb2ec4bbfef904b822625c2d61da91b1b800f2df"

  url "https://github.com/mvcompany8500-web/sasarisa/releases/download/v#{version}/Sasarisa-#{version}.zip"
  name "Sasarisa"
  name "사사리사"
  desc "Voice assistant: say its name and your Mac does it, coding handed to Claude Code"
  homepage "https://sasarisa.com/"

  depends_on macos: :sonoma
  depends_on formula: "whisper-cpp"
  depends_on formula: "cliclick"

  app "Sasarisa.app"

  caveats <<~EOS
    Sasarisa was called Mac Butler before 0.7 — your settings in ~/.macbutler carry over.
    1. Install and log in to Claude Code (or Codex): https://docs.claude.com/en/docs/claude-code/setup
    2. Optional Whisper model (874 MB, more accurate):
         mkdir -p ~/.macbutler/models && curl -L -o ~/.macbutler/models/ggml-large-v3-turbo-q8_0.bin \\
           https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-large-v3-turbo-q8_0.bin
    3. open -a Sasarisa, then say 「사사리사」 or “Sasarisa”.
  EOS

  zap trash: "~/.macbutler"
end
