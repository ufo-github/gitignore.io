import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectMustache

import Foundation


//TemplateCreationController().parseTemplates(directory: TemplateCreationController.projectRootDirectory)
//
//
//let bwp = Bundle.main.bundlePath + "/Settings"
//debugPrint(bwp)
////let settingsBundle = Bundle.path(forResource: "Settings", ofType: "bundle", inDirectory: Bundle.main.bundlePath)
//
//let settingsBundle = Bundle(path: Bundle.main.bundlePath + "/Settings.bundle")
//let groupString = NSLocalizedString("Group", tableName: "Root", bundle: settingsBundle!, value: "", comment: "Group")
//
//debugPrint(ls)



let server = HTTPServer()

var routes = Routes()

// MARK: - Web routes

routes.add(method: .get, uri: "/", handler: {
    request, response in
    response.setHeader(.contentType, value: "text/html")
    mustacheRequest(request: request, response: response, handler: IndexHandler(), templatePath: request.documentRoot + "/index.mustache")
    response.completed()
})

routes.add(method: .get, uri: "/docs", handler: {
    request, response in
    response.setHeader(.contentType, value: "text/html")
    mustacheRequest(request: request, response: response, handler: DocsHandler(), templatePath: request.documentRoot + "/docs.mustache")
    response.completed()
})

// MARK: - API routes
routes.add(method: .get, uri: "/api/*", handler: API().helpHandler)
routes.add(method: .get, uri: "/api/{ignore}", handler: API().templateHandler)
routes.add(method: .get, uri: "/api/f/{ignore}", handler: API().templateFileHandler)
routes.add(method: .get, uri: "/api/list", handler: API().listHandler)

// MARK: - UI
routes.add(method: .get, uri: "/templates.json", handler: UI().dropdownHandler)


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
