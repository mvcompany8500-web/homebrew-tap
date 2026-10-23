cask "my-jarvis" do
  version "0.1.0"
  sha256 "383b46058b03e14dcab69edb17f35b9a013d1199fc97e60e41888409fe0eeb3b"

  url "https://github.com/mvcompany8500-web/my-jarvis/releases/download/v#{version}/MyJarvis-#{version}.zip"
  name "My Jarvis"
  desc "Always-listening voice assistant that hands work to Claude Code"
  homepage "https://github.com/mvcompany8500-web/my-jarvis"

  depends_on macos: ">= :sonoma"
  depends_on formula: "whisper-cpp"
  depends_on formula: "cliclick"

  app "MyJarvis.app"

  # The app is ad-hoc signed (not notarized yet).
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/MyJarvis.app"]
  end

  caveats <<~EOS
    1. Install and log in to Claude Code: https://docs.claude.com/en/docs/claude-code/setup
    2. Optional Whisper model (874 MB):
         mkdir -p ~/.myjarvis/models && curl -L -o ~/.myjarvis/models/ggml-large-v3-turbo-q8_0.bin \\
           https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-large-v3-turbo-q8_0.bin
    3. open -a MyJarvis   →  ◉J menu → Status shows which permissions are missing.
  EOS

  zap trash: "~/.myjarvis"
end
