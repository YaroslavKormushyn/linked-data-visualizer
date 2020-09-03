# linked-data-visualizer

Linked data visualizer for Pharo 7/8 using Roassal2.

## Quick Start

### Data Visualizing

In the system browser navigate to package `LNU-LinkedData-Visual` under tag `Data`.

Pick any `LinkedDataVisualizer` implementation (for example `COOVisualizer`).
In your playground `Do it and go` this:

```smalltalk
COOVisualizer display: 
 (COOSparseMatrix
  withAll:
   {{1 . -1 . 0 . 0}.
   {0 . 3 . 0 . 0}.
   {1 . 0 . 2 . 1}.
   {0 . 0 . 0 . 0}})
```

This should trigger a view window to be opened in the playground with the matrix displayed.

### Operation Visualizing

In the system browser navigate to package `LNU-LinkedData-Visual` under tag `Operations`.

Pick any `LinkedDataOperationVisualizer` implementation (for example `TWSparseMatrixMultiplicationVisualizer`).
In your playground `Do it and go` this:

```smalltalk
    TWSparseMatrixMultiplicationVisualizer example
```

or this, for a bigger example:

```smalltalk
    TWSparseMatrixMultiplicationVisualizer exampleBig
```

This should trigger a view window to be opened in the playground with the matrix operation displayed.
You can control the operation playback with the buttons in the top left:

- Pause - to pause the execution
- Resume - to resume the execution from the paused state
