class Sshpass < Formula
  desc "Pass a password to ssh (insecure but practical)"
  homepage "https://sourceforge.net/projects/sshpass"
  url "https://downloads.sourceforge.net/project/sshpass/sshpass/1.09/sshpass-1.09.tar.gz"
  sha256 "71746e5e057ffe9b00b44ac40453bf47091930cba96bbea8dc48717dedc49fb7"

  bottle do
    root_url "https://github.com/graelo/homebrew-tap/releases/download/sshpass-1.09"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "d2c5767719fd9b8777dd889fe4032fdbafe6b2c195dc9acf93125db55ca1a30e"
    sha256 cellar: :any_skip_relocation, monterey:      "b9f6661c44e8969f8ad55d7dfbc22384855f9e94a3b52fe0133c3b4e4dd07275"
    sha256 cellar: :any_skip_relocation, big_sur:       "04932de6f96980165c66f26aebac21d55cbe1052def35e71c34742b961dcc321"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8b3bc84b0a189f459a8d9bf7c8a593b80f2c3d08fd2cb8da74872150301a5fdb"
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
