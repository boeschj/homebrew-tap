class Shellgpt < Formula
    VERSION = "0.2.1".freeze
  
    desc "AI-powered command-line assistant"
    homepage "https://github.com/boeschj/shellgpt"
    url "https://github.com/boeschj/shellgpt/releases/download/v#{VERSION}/shellgpt-mac-x86_64.tar.gz"
    sha256 "59e44eae949eb890a3d00bc2e3088a0f92b8f71a1200846863385a7188616b07"
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