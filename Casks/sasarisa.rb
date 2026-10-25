cask "sasarisa" do
  version "0.7.2"
  sha256 "f32cee63d6017d56c54811c4d7f730e6524446030cd485851e67df8afffc0be2"

  url "https://github.com/mvcompany8500-web/sasarisa/releases/download/v#{version}/Sasarisa-#{version}.zip"
  name "Sasarisa"
  name "사사리사"
  desc "AI assistant you just talk to: name it, say it, your Mac does it"
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
