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
        return "A planet is a large, rounded astronomical body that is neither a star nor its remnant. The best available theory of planet formation is the nebular hypothesis, which posits that an interstellar cloud collapses out of a nebula to create a young protostar orbited by a protoplanetary disk. Planets grow in this disk by the gradual accumulation of material driven by gravity, a process called accretion. The Solar System has at least eight planets: the terrestrial planets Mercury, Venus, Earth, and Mars, and the giant planets Jupiter, Saturn, Uranus, and Neptune."
    
