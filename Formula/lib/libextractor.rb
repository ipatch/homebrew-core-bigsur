class Libextractor < Formula
  desc "Library to extract meta data from files"
  homepage "https://www.gnu.org/software/libextractor/"
  url "https://ftp.gnu.org/gnu/libextractor/libextractor-1.11.tar.gz"
  mirror "https://ftpmirror.gnu.org/libextractor/libextractor-1.11.tar.gz"
  sha256 "16f633ab8746a38547c4a1da3f4591192b0825ad83c4336f0575b85843d8bd8f"
  license "GPL-3.0-or-later"

  bottle do
    sha256 arm64_sonoma:   "586c05f7772e275ab532feeff02b82d3c9d1cb60af4b26730a91ff6a87e76f03"
    sha256 arm64_ventura:  "dadca081f82925bb7fddd14a386c4f3a5dc789605224670be7baee6a16b3b411"
    sha256 arm64_monterey: "ddbc2b96c8ce52eb446434949f0322190627ed6359b6e9d6cbc41bf4a1ae9b4a"
    sha256 arm64_big_sur:  "46684b1a7a45edf4a8febdff6138463abd97cde89520824575f476f2d500f576"
    sha256 sonoma:         "5fe05558184ccd12990ba692c5c0370f012ac713dd3ebc97d83ccdf3438ee7ba"
    sha256 ventura:        "eaeb728e70963b3ccc62b6ab38b1263f14b29f290452684e90184ea678f0b2e8"
    sha256 monterey:       "b3ec83de128a91eef34977dec6b29e61bdfa8904323d8cc179f7e4d6d12fd267"
    sha256 big_sur:        "c79547c7f5d513ede389034b436fce8a68898827dcbe814540b700286f0ad76b"
    sha256 catalina:       "ecd3a409a45003e3800c0c4e266a991ea7b2b2291e624d5e596f618a8ffbda84"
    sha256 mojave:         "82cfeb01761e5f1878e12a816b225cf8c769c0f8f63e0624fa873bc3994c598b"
    sha256 x86_64_linux:   "ecb55dec4d90ae8056b228e2177f3490ee09d65a0cf2cac9278ad44ecb5bd291"
  end

  depends_on "pkg-config" => :build
  depends_on "libtool"

  uses_from_macos "zlib"

  conflicts_with "csound", because: "both install `extract` binaries"
  conflicts_with "pkcrack", because: "both install `extract` binaries"

  def install
    ENV.deparallelize

    system "./configure", "--disable-silent-rules",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    fixture = test_fixtures("test.png")
    assert_match "Keywords for file", shell_output("#{bin}/extract #{fixture}")
  end
end
