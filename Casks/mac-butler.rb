cask "mac-butler" do
  version "0.6.4"
  sha256 "9d58f182de28749c1a01d0a16a98f91e60d380d50a3a21367ce5ec8c3bd909a5"

  url "https://github.com/mvcompany8500-web/mac-butler/releases/download/v#{version}/MacButler-#{version}.zip"
  name "Mac Butler"
  desc "Always-listening voice assistant that hands work to Claude Code"
  homepage "https://github.com/mvcompany8500-web/mac-butler"

  depends_on macos: ">= :sonoma"
  depends_on formula: "whisper-cpp"
  depends_on formula: "cliclick"

  app "MacButler.app"


  caveats <<~EOS
    1. Install and log in to Claude Code: https://docs.claude.com/en/docs/claude-code/setup
    2. Optional Whisper model (874 MB):
         mkdir -p ~/.macbutler/models && curl -L -o ~/.macbutler/models/ggml-large-v3-turbo-q8_0.bin \\
           https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-large-v3-turbo-q8_0.bin
    3. open -a MacButler  →  ◉ menu → Status shows which permissions are missing.
  EOS

  zap trash: "~/.macbutler"
end
