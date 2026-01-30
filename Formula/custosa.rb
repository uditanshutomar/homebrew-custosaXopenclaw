class Custosa < Formula
  include Language::Python::Virtualenv

  desc "Prompt Injection Protection for OpenClaw/Moltbot"
  homepage "https://github.com/uditanshutomar/CustosaXopenclaw"
  url "https://github.com/uditanshutomar/CustosaXopenclaw/archive/refs/tags/1.1.0.tar.gz"
  sha256 "c0ebf61fa89dec2eea8fca16cb455730f6d6aafadc86f24ecb09b06ad8c04fcf"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")

    # Install dependencies
    system libexec/"bin/pip", "install", "aiohttp>=3.9", "websockets>=12.0", "python-telegram-bot>=20.0", "requests>=2.28.0"

    # Install custosa itself
    venv.pip_install buildpath

    # Link the binary
    bin.install_symlink libexec/"bin/custosa"
  end

  def caveats
    <<~EOS
      To start using Custosa, run:
        custosa install

      To reconfigure Telegram:
        custosa install --reconfigure-telegram

      For status and logs:
        custosa status
        custosa logs
    EOS
  end

  test do
    system "#{bin}/custosa", "--help"
  end
end
