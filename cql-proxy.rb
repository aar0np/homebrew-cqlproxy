class CqlProxy < Formula
  desc "The cql-proxy sidecar enables applications that are currently using Apache Cassandra or DataStax Enterprise (DSE) to use Astra DB without requiring any code changes."
  homepage "https://github.com/datastax/cql-proxy"
  url "https://github.com/datastax/cql-proxy/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "060185758739b7bfcb719dd2d1679b35c7f8161866f110078a4395df9c2abe65"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match true, strings.HasPrefix(shell_output("./cql-proxy"), "cql-proxy: error: must provide either bundle path or contact points")
  end
end
