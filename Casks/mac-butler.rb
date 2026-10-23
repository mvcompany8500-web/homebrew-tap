cask "mac-butler" do
  version "0.2.0"
  sha256 "e64a655b68d8cf37c147250eb5557135ec9fe739f84feea93a4a75c711f375b8"

  url "https://github.com/mvcompany8500-web/mac-butler/releases/download/v#{version}/MacButler-#{version}.zip"
  name "Mac Butler"
  desc "Always-listening voice assistant that hands work to Claude Code"
  homepage "https://github.com/mvcompany8500-web/mac-butler"

  depends_on macos: ">= :sonoma"
  depends_on formula: "whisper-cpp"
  depends_on formula: "cliclick"

  app "MacButler.app"

  # The app is ad-hoc signed (not notarized yet).
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/MacButler.app"]
  end

  caveats <<~EOS
    1. Install and log in to Claude Code: https://docs.claude.com/en/docs/claude-code/setup
    2. Optional Whisper model (874 MB):
         mkdir -p ~/.macbutler/models && curl -L -o ~/.macbutler/models/ggml-large-v3-turbo-q8_0.bin \\
           https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-large-v3-turbo-q8_0.bin
    3. open -a MacButler  →  ◉ menu → Status shows which permissions are missing.
  EOS

  zap trash: "~/.macbutler"
end
