package au.org.ala.webapi

class WebserviceListController {

    def byCategory() {

      def categories = au.org.ala.webapi.Category.list()

      def wsByCategory = [:]

      categories.each { category ->
          def webservices = WebService.getByCategory(category)
          wsByCategory[category] = webservices
      }

      //[wsByCategory: wsByCategory]
      render(view: "byGroup", model: [wsByGroup: wsByCategory])
    }

    def byApp() {

      def apps = au.org.ala.webapi.App.list()

      def wsByApp = [:]

      apps.each { app ->
          wsByApp[app] = app.webservices
      }

//      [wsByApp: wsByApp]
      render(view: "byGroup", model: [wsByGroup: wsByApp])
    }

    def bySpecificApp() {

      def app = App.findByName(params.name)

      def wsByApp = [:]

      wsByApp[app] = app.webservices

      render(view: "byGroup", model: [wsByGroup: wsByApp])
    }
}