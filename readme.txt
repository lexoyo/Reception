About Reception
New Page
Edit Page
Page History
Reception is a library written in the HaXe programming language. This library provides cross-target UI components, mostly used to create forms. It is based on the Cocktail lib, providing cross-target DOM manipulation.

Scope
Reception provides completely cross-target form components such as buttons, combo-box, text inputs... No conditional compilation is required to manipulate them. It is done by exposing a high level API for each of the controls, the inconsistencies between targets are abstracted by Reception.

Each of this controls will inherit the DOMElement interface provided by Cocktail. The target supported in Reception will be the same as in Cocktail and the library will follow its evolutions.

Reception won't deal with form interactions at first, for instance, clicking on a "submit" controls won't automatically triggers the form submission, unlike HTML. While it may seem like a step down from HTML, this design choice will smooth the targets inconsistencies. For instance, Flash as no built-in Form submission mechanic. It will also improve each control independence and prevent this library from turning into a more restrictive framework. Form submission will eventually be added to the library unless they belong to a higher abstraction.

Form validation will also probably be added to the library eventually.

Native vs Custom UI components
Reception will provide two distinct sets of components :

A "native" set using for instance in HTML the native browser controls (displayed via an "input" tag).
A "custom" set built using mostly DOMElements from Cocktail.
The "native" set will be easier to support, it will only requires binding to a runtime specific component. For instance, for a text input, in Flash an fl.controls.TextInput object will be used whereas in JavaScript, a text input will be created. The native UI component will have a better integration with the browsers, especially in HTML, however their visual style won't be easily editable except for the Flash target where they will all be contained in an external .swf.

The "custom" set will be created from other DOMElement, such as the ImageDOMElement. They will be harder to create but will provide the same display across targets.

Both sets of components should have a compatible interface so that ideally, compiling for one or the other set is only determined by a compilation switch.

Target support
The first targets supported by Reception will be ActionScript 3 and JavaScript, and will be closely followed by PHP. Eventually the cpp target will be supported, by mapping to a native cpp library for "native" components such as GTK.

Supported components
Here is a non-exhaustive list of controls that will be supported by Reception :

Button
Form
Text input
Text Area
Combo-box
Radio button
Check-box
Those are the classic form inputs, supported across all browsers in HTML. The new HTML5 inputs such as "color" (color-picker) or "range" will be included next, once the API is stabilized.

The Form container
A Form DOMElement will be provided exposing for instance an "action" and "method" attribute but won't automatically submit a form like in HTML when a "submit" input is pressed.

Submit and Reset input
Submit and reset input won't be provided until an abstraction of the form submission is implemented.

Radio group
Like submit and reset input, radio group are aware of their containing form and so won't be provided at first.

Server-side implementation
Server-side language such as PHP will return HTML containing the right input tag for each instantiated form inputs.

GET/POST data
Once a form is submitted, it should send concatenate the data to a remote url with an http request. This will be abstracted with a future remoting API coming from Cocktail.
