class FdkAac < Formula
  desc "Standalone library of the Fraunhofer FDK AAC code from Android"
  homepage "https://sourceforge.net/projects/opencore-amr/"
  url "https://downloads.sourceforge.net/project/opencore-amr/fdk-aac/fdk-aac-2.0.2.tar.gz"
  sha256 "c9e8630cf9d433f3cead74906a1520d2223f89bcd3fa9254861017440b8eb22f"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any,                 arm64_sonoma:   "669bb57f27662a3f4843ebc7a4e085941f565f5bf263fd54f5fbb33d1b90df2f"
    sha256 cellar: :any,                 arm64_ventura:  "0dfd3c06ff84ebc5a949285ead851789d1747aa2bbed4e1285514f14dc5f75d8"
    sha256 cellar: :any,                 arm64_monterey: "7c598c4a188a07504c33e9ff372cb20143b858a53990ecb195abbf7b9f95b589"
    sha256 cellar: :any,                 arm64_big_sur:  "cf0840a736c0cd0f009e7b3015545ac46fc6c5474163c4f04514065b6cc16454"
    sha256 cellar: :any,                 sonoma:         "0220a30892a18f5b1800de6b0a138ba8c7e5384a5647ec3c5bfa2e1ab3e474eb"
    sha256 cellar: :any,                 ventura:        "368ae83fd4963b92640eb37f181e1da9227e862cda47f6bef7b83e4c58db3f83"
    sha256 cellar: :any,                 monterey:       "c56a5fdcf8b72203513da0cd660830a7fb27fbbb25b4427298ddabd3db4ff881"
    sha256 cellar: :any,                 big_sur:        "21df35d8501a3962ae713c598b4c94300938cabe8bded66021d0aff129fe00ef"
    sha256 cellar: :any,                 catalina:       "b4e0f2728235e4763c6a4d95b0c4eafdb28119e5f4f22397e23e35dacb88e8a8"
    sha256 cellar: :any,                 mojave:         "76e2a579c432470211d10a58284267edce7eae47ccfea7ed334426b9594d309a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "6e90cbfbfab43b0c65c9579d09096e76ccdba404bc39ddc94ee1e9df1deee5bc"
  end

  head do
    url "https://git.code.sf.net/p/opencore-amr/fdk-aac.git", branch: "master"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-example"
    system "make", "install"
  end

  test do
    system "#{bin}/aac-enc", test_fixtures("test.wav"), "test.aac"
    assert_predicate testpath/"test.aac", :exist?
  end
end
