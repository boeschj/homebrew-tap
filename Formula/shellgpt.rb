class Shellgpt < Formula
    VERSION = "0.2.0-alpha".freeze
  
    desc "AI-powered command-line assistant"
    homepage "https://github.com/boeschj/shellgpt"
    url "https://github.com/boeschj/shellgpt/releases/download/v#{VERSION}/shellgpt-mac-x86_64.tar.gz"
    sha256 "d92fe773a2c8d80f0844a5a2ef8b8797f6bee893b5d8499e2947648b4f4781fe"
    version VERSION
    license "MIT"
  
    def install
      bin.install "shellgpt"
      man1.install "shellgpt.1" if File.exist? "shellgpt.1"
    end
  
    def caveats
      <<~EOS
        Before using shellgpt, you need to set your OpenAI API key:
          echo 'export OPENAI_API_KEY=your-key-here' >> ~/.zshrc
          source ~/.zshrc
      EOS
    end
  
    test do
      assert_match "ShellGPT", shell_output("#{bin}/shellgpt --help")
    end
  end