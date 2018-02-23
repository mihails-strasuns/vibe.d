/++ dub.sdl:
	dependency "vibe-d" version="~>0.8.3-alpha.4"
+/
import vibe.core.core;
import vibe.http.client;
import vibe.http.server;

void main()
{
    auto settings = new HTTPServerSettings;
    settings.port = 8080;
    settings.bindAddresses = ["::1"];
    listenHTTP(settings, (req, res) { res.writeBody("Hello, World!"); });

    runTask({
        auto resp = requestHTTP("http://[::1]:8080/");
        assert(resp.statusCode == 200, resp.toString);
        resp.dropBody();
        exitEventLoop();
    });
    runApplication();
}
