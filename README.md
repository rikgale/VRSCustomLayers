# Overlays and map controls for Virtual Radar Server (VRS) using Leaflet maps.

This JavaScript code is a plugin for the ADSB aircraft tracking [Virtual Radar Server](http://www.virtualradarserver.co.uk) software. The Javascript files need to be used with the Virtual Radar Server [Custom Content plugin](http://www.virtualradarserver.co.uk/Documentation/CustomContent/Default.aspx).

This repo brings together and updates several scripts (`EndOfHead.html` and `EndOfBody.html`) written by others as well as adds new scripts (`Scale.html` and `Fullscreen.html`)

#### `EndOfHead.html` and `EndOfBody.html`

These two files work in tandem to insert a icon with pop up at the bottom left of the map and allows the user to select airspace layers, weather layers and UK specific overlays which will be added to the base Leaflet map used in VRS.

Users will need to sign up for an [Open Weather 1.0 API key](https://openweathermap.org/api/weathermaps) and also an [OpenAIP Key](https://www.openaip.net/). These keys need to be inserted at lines 20 & 21 of `EndOfBody.html`. Ensure that the `' '` are kept. 

#### `Fullscreen.html`

Adds a full screen button to the VRS map under the zoom +/- buttons and moves the +/- buttons to the top right of the screen.

#### `Scale.html`

Adds a distance scale next to the VRS menu in the top left of the map

## Installation

Put the HTML files in the required folder for the Custom Content plugin as per Custom Content plugin instructions and the entire contents of `Put these files in VRS root folder` folder into the root folder referenced by the Custom Content plugin and then set up the files injections as per the bottom 4 lines in the below image:

![Screenshot](https://github.com/rikgale/VRSCustomLayers/blob/main/customcontentoptions.jpeg)

### Localisation

Defaults to GB airports etc. If you wish to change to airports for your country remove the country code  e.g. `DE` from the end of the .geojson files in the `Put these files in VRS root folder` before placing them in the root folder for your VRS

`airportsDE.geojson` --> `airports.geojson`

Countries added on request - please open an issue to request

##### IMPORTANT NOTICE: These overlays contain aviation airscape, weather, navigational aids, airfield information, etc. All of these are purely for entertainment / hobby use and MUST NEVER be relied upon to any extent for real world aviation / flying. You should always use the latest legal airspace charts and weather information as published by official sources. This is not an official source. By using this code you agree to make users of your webpage aware of this, and agree that the publisher is not responsible for any loss or damage resulting from the use of this code. The airspace charts, navigational aids,aerodrome information, weather, etc will not be 100% complete or accurate and will contain errors.

##### THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

I am very grateful for the following resources which have been used in this code:

- Airspace overlay data courtesy of [Open AIP](http://www.openaip.net)
- Weather overlay images courtesy of [Open Weather](https://openweathermap.org)
- Original script work for EndOfHead and EndOfBody from [Charlie Gulf Aviation](https://www.youtube.com/channel/UCcy9zUttQEi-yRMEXTtBpRg)
- Waypoint markers from [sam210723](https://github.com/sam210723/vrs-waypoints)
- Leaflet grouped layer control from [ismyrnow](https://github.com/ismyrnow/leaflet-groupedlayercontrol)
- Night and day overlay from [Jörg Dietrich](http://joergdietrich.github.io/Leaflet.Terminator/)
- Baselayer colour filters from [xtk93x](https://github.com/xtk93x/Leaflet.TileLayer.ColorFilter.git)
- Leaflet awesome markers from [Ivoogdt](https://github.com/lvoogdt/Leaflet.awesome-markers)
- forked/copied from [M7SPI/vrs-overlays](https://github.com/M7SPI/vrs-overlays)

Screenshot of working example:

![Screenshot](https://github.com/rikgale/VRSCustomLayers/blob/main/screenshot.jpeg)

Also can be seen working on my VRS page - [cornwallvrs.duckdns.org/vrs](https://www.cornwallvrs.duckdns.org/vrs).
