from robot.api.deco import keyword,library

@library
class Browser:
    @keyword
    def new_browser(self, browser, headless):
        return None
    
    @keyword
    def new_context(self, viewport):
        return None
    
    @keyword
    def new_page(self, url):
        return None
    
    @keyword
    def close_page(self):
        return None

    @keyword
    def close_context(self):
        return None
    
    @keyword
    def close_browser(self):
        return None
    
    @keyword
    def get_text(self, locator):
        return None
    
