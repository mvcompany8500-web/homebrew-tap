cask "mac-butler" do
  version "0.6.3"
  sha256 "b9745cdf5d7aea38d6eefab948dec3ddc9c850b5e8efe1d20bf7f00a46db87d9"

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
