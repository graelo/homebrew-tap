class Sshpass < Formula
  desc "Pass a password to ssh (insecure but practical)"
  homepage "https://sourceforge.net/projects/sshpass"
  url "https://downloads.sourceforge.net/project/sshpass/sshpass/1.08/sshpass-1.08.tar.gz"
  sha256 "8bdacb8ca4ecf82c84a5effa2f75a8bf4ed9dd6f9d030f308fe11cffb3830b02"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/sshpass-1.08"
    sha256 cellar: :any_skip_relocation, big_sur:      "d7f867910f7711d8d7fa6e7462c0dbc17c1fd49ca6349c5ee0395907eb4e998c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "13c2b24a85896ea09ca2451f724350de8d275f4805382bf91b5f584d53c8680d"
  end

  depends_on "gnu-sed"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "sshpass"
  end
end
