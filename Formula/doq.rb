class Doq < Formula
  include Language::Python::Virtualenv

  desc "Docstring generator"
  homepage "https://github.com/heavenshell/py-doq"
  url "https://files.pythonhosted.org/packages/e4/39/7c8d771f6703f84f9edf2f713a6f973b993997b7c09cecbc309666ce8239/doq-0.6.0.tar.gz"
  sha256 "861e16d8f3553a46d2cd98fe087686bd9333c1987e7e3385f287e166f77a37d1"

  depends_on "python"

  resource "Jinja2" do
    url "https://files.pythonhosted.org/packages/64/a7/45e11eebf2f15bf987c3bc11d37dcc838d9dc81250e67e4c5968f6008b6c/Jinja2-2.11.2.tar.gz"
    sha256 "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0"
  end

  resource "MarkupSafe" do
    url "https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094/MarkupSafe-1.1.1.tar.gz"
    sha256 "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
  end

  resource "parso" do
    url "https://files.pythonhosted.org/packages/fe/24/c30eb4be8a24b965cfd6e2e6b41180131789b44042112a16f9eb10c80f6e/parso-0.7.0.tar.gz"
    sha256 "908e9fae2144a076d72ae4e25539143d40b8e3eafbaeae03c1bfe226f4cdf12c"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    ENV["LC_ALL"] = "en_US.UTF-8"

    assert_match version.to_s, shell_output("#{bin}/doq --version")
  end
end
