class Commandlm < Formula
    VERSION = "0.3.0".freeze
  
    desc "AI-powered command-line assistant"
    homepage "https://github.com/boeschj/commandlm"
    url "https://github.com/boeschj/commandlm/releases/download/v#{VERSION}/commandlm-mac-x86_64.tar.gz"
    sha256 "b5669f33f6d6740fe39443bd0c5d31bc914b708f9f825ad1daca9a35997355b2"
    version VERSION
    license "MIT"
  
    def install
      bin.install "commandlm"
      man1.install "commandlm.1" if File.exist? "commandlm.1"
    end
  
    def caveats
      <<~EOS
        Before using commandlm, you need to set your OpenAI API key:
          echo 'export OPENAI_API_KEY=your-key-here' >> ~/.zshrc
          source ~/.zshrc
      EOS
    end
  
    test do
      assert_match "CommandLM", shell_output("#{bin}/commandlm --help")
    end
  end