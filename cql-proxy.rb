class CqlProxy < Formula
  desc "DataStax cql-proxy enables Cassandra apps to use Astra DB without code changes"
  homepage "https://github.com/datastax/cql-proxy"
  url "https://github.com/datastax/cql-proxy/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "25cd9a87078c11caed7da14d2b8b85e5240bfe1aff5b666d0dcad9e73c15b305"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "astra-bundle", shell_output("cql-proxy --help 2>&1")
  end
end
