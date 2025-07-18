class Commandlm < Formula
    VERSION = "1.0.0".freeze
  
    desc "AI-powered command-line assistant"
    homepage "https://github.com/boeschj/commandlm"
    url "https://github.com/boeschj/commandlm/releases/download/v#{VERSION}/commandlm-mac-x86_64.tar.gz"
    sha256 "20e0041ff64a4b0557e3381921cf65cd05ba99a37c8bdbcc7c22cfd74eb5bc54"
    version VERSION
    license "MIT"
  
    def install
      bin.install "clm"
      man1.install "clm.1" if File.exist? "clm.1"
    end
  
    def caveats
      <<~EOS
        Before using commandlm, you need to set your OpenAI API key:
          echo 'export OPENAI_API_KEY=your-key-here' >> ~/.zshrc
          source ~/.zshrc
      EOS
    end
  
    test do
      assert_match "CommandLM", shell_output("#{bin}/clm --help")
    end
  end