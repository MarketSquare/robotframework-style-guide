from robot.api.deco import keyword,library

@library
class Browser:
    @keyword
    def new_browser(browser, headless):
        return None
    
    @keyword
    def new_context(viewport):
        return None
    
    @keyword
    def new_page(url):
        return None
    
    @keyword
    def close_page():
        return None

    @keyword
    def close_context():
        return None
    
    @keyword
    def close_browser():
        return None
    
    @keyword
    def get_text(locator):
        return None
    
