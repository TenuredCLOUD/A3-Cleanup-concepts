# Arma 3 Simple Cleanup Concepts

This repository contains simple cleanup concepts for Arma 3. The scripts provided are designed to be easy to use and extend. 

## Features

- Simple and efficient cleanup scripts
- Easy to add new models to the cleanup list
- Designed for use in the Arma 3 editor

## Usage

To use the cleanup scripts, follow these steps:

1. Place the items you want to clean up in the Arma 3 editor.
2. Use the following code snippet to add models to the cleanup list:

`// Define the types of objects
private _types = ["myobjectclassname"];

// Initialize an empty array to store the model info
private _modelInfoArray = [];

// For each type, create a temporary object, get its model info, and then delete it
{
    private _tempObject = createVehicle [_x, [0,0,0], [], 0, "NONE"];
    private _modelInfo = getModelInfo _tempObject;
    deleteVehicle _tempObject;
    _modelInfoArray pushBack _modelInfo;
} forEach _types;

// Print the model info array
_modelInfoArray`

3. You can use `typeOf cursorObject` to get classnames to add to the list, or simply log info from objects via the editor. The snippet will print the model asset names for the entire list of classnames, which can then be plugged into the scripts.

## License

This project is licensed under the GNU General Public License v2.0. 

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue if you have any suggestions or improvements.
