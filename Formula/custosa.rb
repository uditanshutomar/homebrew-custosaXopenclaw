class Custosa < Formula
  include Language::Python::Virtualenv

  desc "Prompt Injection Protection for OpenClaw/Moltbot"
  homepage "https://github.com/uditanshutomar/CustosaXopenclaw"
  url "https://github.com/uditanshutomar/CustosaXopenclaw/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "5575a22d3b91fa6ad374ef691aed74c1d54057352e6f378cc919070c2100490a"
  license :cannot_represent

  depends_on "python@3.12"

  def install
    # Create virtualenv
    venv = virtualenv_create(libexec, "python3.12")

    # Install custosa with all dependencies using pip directly
    system libexec/"bin/python", "-m", "pip", "install", "--upgrade", "pip"
    system libexec/"bin/python", "-m", "pip", "install", buildpath

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
