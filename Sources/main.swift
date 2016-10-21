import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectMustache


let server = HTTPServer()

var routes = Routes()
routes.add(method: .get, uri: "/", handler: {
    request, response in
    response.setHeader(.contentType, value: "text/html")
    mustacheRequest(request: request, response: response, handler: IndexHandler(), templatePath: request.documentRoot + "/index.mustache")
    response.completed()
}
)

routes.add(method: .get, uri: "/docs", handler: {
    request, response in
    response.setHeader(.contentType, value: "text/html")
    mustacheRequest(request: request, response: response, handler: DocsHandler(), templatePath: request.documentRoot + "/docs.mustache")
    response.completed()
}
)

server.addRoutes(routes)
server.serverPort = 8181
server.documentRoot = "./webroot"

configureServer(server)

do {
    // Launch the HTTP server.
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}
