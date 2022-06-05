function [ cdata hotspot ] = myPointers( ptr )

switch lower(ptr)

   case 'arrow'
     cdata=[...
       2   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   1   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   1   1   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   1   1   1   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   1   1   1   1   1   1   2 NaN NaN NaN NaN NaN NaN NaN
       2   1   1   1   1   1   1   1   1   2 NaN NaN NaN NaN NaN NaN
       2   1   1   1   1   1   2   2   2   2   2 NaN NaN NaN NaN NaN
       2   1   1   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   2 NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
       2   2 NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
       2 NaN NaN NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN   2   2   2 NaN NaN NaN NaN NaN NaN NaN
    ];
       hotspot = [1 1];

   case 'add'
     cdata=[...
       2   2 NaN NaN NaN NaN NaN NaN NaN NaN   2 NaN NaN NaN NaN NaN
       2   1   2 NaN NaN NaN NaN NaN NaN   2   1   2 NaN NaN NaN NaN
       2   1   1   2 NaN NaN NaN NaN   2   2   1   2   2 NaN NaN NaN
       2   1   1   1   2 NaN NaN   2   1   1   1   1   1   2 NaN NaN
       2   1   1   1   1   2 NaN NaN   2   2   1   2   2 NaN NaN NaN
       2   1   1   1   1   1   2 NaN NaN   2   1   2 NaN NaN NaN NaN
       2   1   1   1   1   1   1   2 NaN NaN   2 NaN NaN NaN NaN NaN
       2   1   1   1   1   1   1   1   2 NaN NaN NaN NaN NaN NaN NaN
       2   1   1   1   1   1   1   1   1   2 NaN NaN NaN NaN NaN NaN
       2   1   1   1   1   1   2   2   2   2   2 NaN NaN NaN NaN NaN
       2   1   1   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   2 NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
       2   2 NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
       2 NaN NaN NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN   2   2   2 NaN NaN NaN NaN NaN NaN NaN
    ];
       hotspot = [1 1];

   case 'addpole'
     cdata=[...
       2   2 NaN NaN NaN NaN NaN   2   2   2 NaN NaN   2   2 NaN NaN
       2   1   2 NaN NaN NaN NaN   2   1   2 NaN   2   1   2 NaN NaN
       2   1   1   2 NaN NaN NaN NaN   2   1   2   1   2   2 NaN NaN
       2   1   1   1   2 NaN NaN NaN NaN   2   1   2 NaN NaN NaN NaN
       2   1   1   1   1   2 NaN NaN   2   1   2   1   2   2 NaN NaN
       2   1   1   1   1   1   2   2   1   2 NaN   2   1   2 NaN NaN
       2   1   1   1   1   1   1   2   2 NaN NaN NaN   2   2 NaN NaN
       2   1   1   1   1   1   1   1   2 NaN NaN NaN NaN NaN NaN NaN
       2   1   1   1   1   1   1   1   1   2 NaN NaN NaN NaN NaN NaN
       2   1   1   1   1   1   2   2   2   2   2 NaN NaN NaN NaN NaN
       2   1   1   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   2 NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
       2   2 NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
       2 NaN NaN NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN   2   2   2 NaN NaN NaN NaN NaN NaN NaN
    ];
       hotspot = [1 1];

	case 'adddoublepole'
     cdata=[...
       2   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   2 NaN NaN NaN NaN NaN NaN NaN   1   2   1 NaN NaN NaN
       2   1   1   2 NaN NaN NaN NaN NaN NaN   2   1   2 NaN NaN NaN
       2   1   1   1   2 NaN NaN NaN NaN NaN   1   2   1 NaN NaN NaN
       2   1   1   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   1   1   1   1   2 NaN NaN NaN   1   2   1 NaN NaN NaN
       2   1   1   1   1   1   1   2 NaN NaN   2   1   2 NaN NaN NaN
       2   1   1   1   1   1   1   1   2 NaN   1   2   1 NaN NaN NaN
       2   1   1   1   1   1   1   1   1   2 NaN NaN NaN NaN NaN NaN
       2   1   1   1   1   1   2   2   2   2   2 NaN NaN NaN NaN NaN
       2   1   1   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   2 NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
       2   2 NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
       2 NaN NaN NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN   2   2   2 NaN NaN NaN NaN NaN NaN NaN
    ];
       hotspot = [1 1];

   case 'addzero'
     cdata=[...
       2   2 NaN NaN NaN NaN NaN NaN   2   2   2   2   2 NaN NaN NaN
       2   1   2 NaN NaN NaN NaN   2   2   1   1   1   2   2 NaN NaN
       2   1   1   2 NaN NaN NaN   2   1   2   2   2   1   2 NaN NaN
       2   1   1   1   2 NaN NaN   2   1   2 NaN   2   1   2 NaN NaN
       2   1   1   1   1   2 NaN   2   1   2   2   2   1   2 NaN NaN
       2   1   1   1   1   1   2   2   2   1   1   1   2   2 NaN NaN
       2   1   1   1   1   1   1   2   2   2   2   2   2 NaN NaN NaN
       2   1   1   1   1   1   1   1   2 NaN NaN NaN NaN NaN NaN NaN
       2   1   1   1   1   1   1   1   1   2 NaN NaN NaN NaN NaN NaN
       2   1   1   1   1   1   2   2   2   2   2 NaN NaN NaN NaN NaN
       2   1   1   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   2 NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
       2   2 NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
       2 NaN NaN NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN   2   2   2 NaN NaN NaN NaN NaN NaN NaN
    ];
       hotspot = [1 1];

	case 'adddoublezero'
     cdata=[...
       2   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN   2 NaN NaN NaN
       2   1   2 NaN NaN NaN NaN NaN NaN NaN NaN   2   1   2 NaN NaN
       2   1   1   2 NaN NaN NaN NaN NaN NaN   2   1   2   1   2 NaN
       2   1   1   1   2 NaN NaN NaN NaN NaN NaN   2   1   2 NaN NaN
       2   1   1   1   1   2 NaN NaN NaN NaN NaN NaN   2 NaN NaN NaN
       2   1   1   1   1   1   2 NaN NaN NaN NaN   2   1   2 NaN NaN
       2   1   1   1   1   1   1   2 NaN NaN   2   1   2   1   2 NaN
       2   1   1   1   1   1   1   1   2 NaN NaN   2   1   2 NaN NaN
       2   1   1   1   1   1   1   1   1   2 NaN NaN   2 NaN NaN NaN
       2   1   1   1   1   1   2   2   2   2   2 NaN NaN NaN NaN NaN
       2   1   1   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   2 NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
       2   2 NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
       2 NaN NaN NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   1   2 NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN   2   2   2 NaN NaN NaN NaN NaN NaN NaN
    ];
       hotspot = [1 1];

   case 'closedhand'
       cdata = [...
         NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
         NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
         NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
         NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
         NaN NaN NaN NaN   1   1 NaN   1   1 NaN   1   1 NaN NaN NaN NaN
         NaN NaN NaN   1   2   2   1   2   2   1   2   2   1   1 NaN NaN
         NaN NaN NaN   1   2   2   2   2   2   2   2   2   1   2   1 NaN
         NaN NaN NaN NaN   1   2   2   2   2   2   2   2   2   2   1 NaN
         NaN NaN NaN   1   1   2   2   2   2   2   2   2   2   2   1 NaN
         NaN NaN   1   2   2   2   2   2   2   2   2   2   2   2   1 NaN
         NaN NaN   1   2   2   2   2   2   2   2   2   2   2   2   1 NaN
         NaN NaN   1   2   2   2   2   2   2   2   2   2   2   1 NaN NaN
         NaN NaN NaN   1   2   2   2   2   2   2   2   2   2   1 NaN NaN
         NaN NaN NaN NaN   1   2   2   2   2   2   2   2   1 NaN NaN NaN
         NaN NaN NaN NaN NaN   1   2   2   2   2   2   2   1 NaN NaN NaN
         NaN NaN NaN NaN NaN   1   2   2   2   2   2   2   1 NaN NaN NaN
         ];
              hotspot = [10 9];

  case 'eraser'
     cdata = [...
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
       1   1   1   1   1   1   1 NaN NaN NaN NaN NaN NaN NaN NaN NaN
       1   1   2   2   2   2   2   1 NaN NaN NaN NaN NaN NaN NaN NaN
       1   2   1   2   2   2   2   2   1 NaN NaN NaN NaN NaN NaN NaN
       1   2   2   1   2   2   2   2   2   1 NaN NaN NaN NaN NaN NaN
     NaN   1   2   2   1   2   2   2   2   2   1 NaN NaN NaN NaN NaN
     NaN NaN   1   2   2   1   2   2   2   2   2   1 NaN NaN NaN NaN
     NaN NaN NaN   1   2   2   1   2   2   2   2   2   1 NaN NaN NaN
     NaN NaN NaN NaN   1   2   2   1   2   2   2   2   2   1 NaN NaN
     NaN NaN NaN NaN NaN   1   2   2   1   2   2   2   2   2   1 NaN
     NaN NaN NaN NaN NaN NaN   1   2   2   1   1   1   1   1   1   1
     NaN NaN NaN NaN NaN NaN NaN   1   2   1   2   2   2   2   2   1
     NaN NaN NaN NaN NaN NaN NaN NaN   1   1   1   1   1   1   1   1
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
    ];
       hotspot = [2 1];

   case 'forbidden'
       cdata = [...
     NaN NaN NaN   2   2   1   1   1   1   1   2   2 NaN NaN NaN NaN
     NaN NaN   2   1   1   1   1   1   1   1   1   1   2 NaN NaN NaN
     NaN   2   1   1   1   2   2   2   2   2   1   1   1   2 NaN NaN
       2   1   1   1   2 NaN NaN NaN NaN   2   1   1   1   1   2 NaN
       2   1   1   2 NaN NaN NaN NaN   2   1   1   1   1   1   2   2
       1   1   2 NaN NaN NaN NaN   2   1   1   1   2   2   1   1   2
       1   1   2 NaN NaN NaN   2   1   1   1   2 NaN   2   1   1   2
       1   1   2 NaN NaN   2   1   1   1   2 NaN NaN   2   1   1   2
       1   1   2 NaN   2   1   1   1   2 NaN NaN NaN   2   1   1   2
       1   1   2   2   1   1   1   2 NaN NaN NaN NaN   2   1   1   2
       2   1   1   1   1   1   2 NaN NaN NaN NaN   2   1   1   2   2
       2   1   1   1   1   2 NaN NaN NaN NaN   2   1   1   1   2 NaN
     NaN   2   1   1   1   2   2   2   2   2   1   1   1   2 NaN NaN
     NaN NaN   2   1   1   1   1   1   1   1   1   1   2 NaN NaN NaN
     NaN NaN NaN   2   2   1   1   1   1   1   2   2 NaN NaN NaN NaN
     NaN NaN NaN NaN   2   2   2   2   2   2   2 NaN NaN NaN NaN NaN
     ];
       hotspot = [8 8];

   case 'glass'
       cdata = [...
         NaN NaN NaN NaN   1   1   1   1 NaN NaN NaN NaN NaN NaN NaN NaN
         NaN NaN   1   1 NaN   2 NaN   2   1   1 NaN NaN NaN NaN NaN NaN
         NaN   1   2 NaN   2 NaN   2 NaN   2 NaN   1 NaN NaN NaN NaN NaN
         NaN   1 NaN   2 NaN   2 NaN   2 NaN   2   1 NaN NaN NaN NaN NaN
           1 NaN   2 NaN   2 NaN   2 NaN   2 NaN   2   1 NaN NaN NaN NaN
           1   2 NaN   2 NaN   2 NaN   2 NaN   2 NaN   1 NaN NaN NaN NaN
           1 NaN   2 NaN   2 NaN   2 NaN   2 NaN   2   1 NaN NaN NaN NaN
           1   2 NaN   2 NaN   2 NaN   2 NaN   2 NaN   1 NaN NaN NaN NaN
         NaN   1   2 NaN   2 NaN   2 NaN   2 NaN   1 NaN NaN NaN NaN NaN
         NaN   1 NaN   2 NaN   2 NaN   2 NaN   2   1   2 NaN NaN NaN NaN
         NaN NaN   1   1   2 NaN   2 NaN   1   1   1   1   2 NaN NaN NaN
         NaN NaN NaN NaN   1   1   1   1 NaN   2   1   1   1   2 NaN NaN
         NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN   2   1   1   1   2 NaN
         NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN   2   1   1   1   2
         NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN   2   1   1   1
         NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN   2   1   2
         ];
              hotspot = [7 7];

   case 'hand'
       cdata = [...
         NaN NaN NaN NaN NaN NaN NaN   1   1 NaN NaN NaN NaN NaN NaN NaN
         NaN NaN NaN   1   1 NaN   1   2   2   1   1   1 NaN NaN NaN NaN
         NaN NaN   1   2   2   1   1   2   2   1   2   2   1 NaN NaN NaN
         NaN NaN   1   2   2   1   1   2   2   1   2   2   1 NaN   1 NaN
         NaN NaN NaN   1   2   2   1   2   2   1   2   2   1   1   2   1
         NaN NaN NaN   1   2   2   1   2   2   1   2   2   1   2   2   1
         NaN   1   1 NaN   1   2   2   2   2   2   2   2   1   2   2   1
           1   2   2   1   1   2   2   2   2   2   2   2   2   2   2   1
           1   2   2   2   1   2   2   2   2   2   2   2   2   2   1 NaN
         NaN   1   2   2   2   2   2   2   2   2   2   2   2   2   1 NaN
         NaN NaN   1   2   2   2   2   2   2   2   2   2   2   2   1 NaN
         NaN NaN   1   2   2   2   2   2   2   2   2   2   2   1 NaN NaN
         NaN NaN NaN   1   2   2   2   2   2   2   2   2   2   1 NaN NaN
         NaN NaN NaN NaN   1   2   2   2   2   2   2   2   1 NaN NaN NaN
         NaN NaN NaN NaN NaN   1   2   2   2   2   2   2   1 NaN NaN NaN
         NaN NaN NaN NaN NaN   1   2   2   2   2   2   2   1 NaN NaN NaN
         ];
              hotspot = [10 9];

   case 'hand1'
       cdata = [...
         NaN NaN NaN NaN NaN NaN NaN   1   1 NaN NaN NaN NaN NaN NaN NaN
         NaN NaN NaN   1   1 NaN   1   2   2   1   1   1 NaN NaN NaN NaN
         NaN NaN   1   2   2   1   1   2   2   1   2   2   1 NaN NaN NaN
         NaN NaN   1   2   2   1   1   2   2   1   2   2   1 NaN   1 NaN
         NaN NaN NaN   1   2   2   1   2   2   1   2   2   1   1   2   1
         NaN NaN NaN   1   2   2   1   2   2   1   2   2   1   2   2   1
         NaN   1   1 NaN   1   2   2   2   2   2   2   2   1   2   2   1
           1   2   2   1   1   2   2   2   1   2   2   2   2   2   2   1
           1   2   2   2   1   2   2   1   1   2   2   2   2   2   1 NaN
         NaN   1   2   2   2   2   2   2   1   2   2   2   2   2   1 NaN
         NaN NaN   1   2   2   2   2   2   1   2   2   2   2   2   1 NaN
         NaN NaN   1   2   2   2   2   2   1   2   2   2   2   1 NaN NaN
         NaN NaN NaN   1   2   2   2   2   1   2   2   2   2   1 NaN NaN
         NaN NaN NaN NaN   1   2   2   1   1   1   2   2   1 NaN NaN NaN
         NaN NaN NaN NaN NaN   1   2   2   2   2   2   2   1 NaN NaN NaN
         NaN NaN NaN NaN NaN   1   2   2   2   2   2   2   1 NaN NaN NaN
         ];
              hotspot = [10 9];

   case 'hand2'
       cdata = [...
         NaN NaN NaN NaN NaN NaN NaN   1   1 NaN NaN NaN NaN NaN NaN NaN
         NaN NaN NaN   1   1 NaN   1   2   2   1   1   1 NaN NaN NaN NaN
         NaN NaN   1   2   2   1   1   2   2   1   2   2   1 NaN NaN NaN
         NaN NaN   1   2   2   1   1   2   2   1   2   2   1 NaN   1 NaN
         NaN NaN NaN   1   2   2   1   2   2   1   2   2   1   1   2   1
         NaN NaN NaN   1   2   2   1   2   2   1   2   2   1   2   2   1
         NaN   1   1 NaN   1   2   2   2   2   2   2   2   1   2   2   1
           1   2   2   1   1   2   2   2   1   1   2   2   2   2   2   1
           1   2   2   2   1   2   2   1   2   2   1   2   2   2   1 NaN
         NaN   1   2   2   2   2   2   2   2   2   1   2   2   2   1 NaN
         NaN NaN   1   2   2   2   2   2   2   1   2   2   2   2   1 NaN
         NaN NaN   1   2   2   2   2   2   1   2   2   2   2   1 NaN NaN
         NaN NaN NaN   1   2   2   2   1   2   2   2   2   2   1 NaN NaN
         NaN NaN NaN NaN   1   2   2   1   1   1   1   2   1 NaN NaN NaN
         NaN NaN NaN NaN NaN   1   2   2   2   2   2   2   1 NaN NaN NaN
         NaN NaN NaN NaN NaN   1   2   2   2   2   2   2   1 NaN NaN NaN
         ];
              hotspot = [10 9];

    case 'help'
       cdata = [...
       2   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   2 NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   1   2 NaN NaN NaN NaN NaN   2   2   2   2   2 NaN NaN
       2   1   1   1   2 NaN NaN NaN   2   1   1   1   1   1   2 NaN
       2   1   1   1   1   2 NaN   2   1   1   1   1   1   1   1   2
       2   1   1   1   1   1   2   2   1   1   2   2   2   1   1   2
       2   1   1   1   1   1   1   2   1   1   2 NaN   2   1   1   2
       2   1   1   1   1   1   1   1   2   2 NaN   2   1   1   2 NaN
       2   1   1   1   1   1   1   1   1   2   2   1   1   2 NaN NaN
       2   1   1   1   1   1   2   2   2   2   1   1   2 NaN NaN NaN
       2   1   1   2   1   1   2 NaN NaN   2   1   1   2 NaN NaN NaN
       2   1   2 NaN   2   1   1   2 NaN   2   2   2   2 NaN NaN NaN
       2   2 NaN NaN   2   1   1   2 NaN   2   1   1   2 NaN NaN NaN
       2 NaN NaN NaN NaN   2   1   1   2   2   1   1   2 NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   1   2   2   2   2   2 NaN NaN NaN
     NaN NaN NaN NaN NaN NaN   2   2   2 NaN NaN NaN NaN NaN NaN NaN
     ];
       hotspot = [2 2];

   case 'lrdrag'
       cdata = [...
     NaN NaN NaN NaN NaN   2   2   2   2   2 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   2   1   2 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   2   1   2 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN   2   2   1   2   1   2   2 NaN NaN NaN NaN NaN
     NaN NaN NaN   2   1   2   1   2   1   2   1   2 NaN NaN NaN NaN
     NaN NaN   2   1   1   2   1   2   1   2   1   1   2 NaN NaN NaN
     NaN   2   1   1   1   1   1   2   1   1   1   1   1   2 NaN NaN
       2   1   1   1   1   1   1   2   1   1   1   1   1   1   2 NaN
     NaN   2   1   1   1   1   1   2   1   1   1   1   1   2 NaN NaN
     NaN NaN   2   1   1   2   1   2   1   2   1   1   2 NaN NaN NaN
     NaN NaN NaN   2   1   2   1   2   1   2   1   2 NaN NaN NaN NaN
     NaN NaN NaN NaN   2   2   1   2   1   2   2 NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   2   1   2 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   2   1   2 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   2   2   2   2 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     ];
       hotspot = [8 8];

   case 'ldrag'
       cdata = [...
     NaN NaN NaN NaN NaN   2   2   2 NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN   2   2   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN   2   1   2   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN   2   1   1   2   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
     NaN   2   1   1   1   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
       2   1   1   1   1   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
     NaN   2   1   1   1   1   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN   2   1   1   2   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN   2   1   2   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN   2   2   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   2 NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   2   2 NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     ];
       hotspot = [8 8];

   case 'rdrag'
       cdata = [...
     NaN NaN NaN NaN NaN NaN NaN NaN   2   2 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN   1   2 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN   1   2 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN   1   2   2 NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN   1   2   1   2 NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN   1   2   1   1   2 NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN   1   1   1   1   1   2 NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN   1   1   1   1   1   1   2 NaN
     NaN NaN NaN NaN NaN NaN NaN NaN   1   1   1   1   1   2 NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN   1   2   1   1   2 NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN   1   2   1   2 NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN   1   2   2 NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN   1   2 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN   1   2 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN   2   2 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     ];
       hotspot = [8 8];

   case 'uddrag'
       cdata = [...
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN   2 NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN   2   1   2 NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   1   1   2 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN   2   1   1   1   1   1   2 NaN NaN NaN NaN NaN
     NaN NaN NaN   2   1   1   1   1   1   1   1   2 NaN NaN NaN NaN
       2   2   2   2   2   2   1   1   1   2   2   2   2   2   2 NaN
       2   1   1   1   1   1   1   1   1   1   1   1   1   1   2 NaN
       2   2   2   2   2   2   2   2   2   2   2   2   2   2   2 NaN
       2   1   1   1   1   1   1   1   1   1   1   1   1   1   2 NaN
       2   2   2   2   2   2   1   1   1   2   2   2   2   2   2 NaN
     NaN NaN NaN   2   1   1   1   1   1   1   1   2 NaN NaN NaN NaN
     NaN NaN NaN NaN   2   1   1   1   1   1   2 NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   1   1   2 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN   2   1   2 NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN   2 NaN NaN NaN NaN NaN NaN NaN NaN
     ];
       hotspot = [9 8];

   case 'udrag'
       cdata = [...
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN   2 NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN   2   1   2 NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   1   1   1   2 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN   2   1   1   1   1   1   2 NaN NaN NaN NaN NaN
     NaN NaN NaN   2   1   1   1   1   1   1   1   2 NaN NaN NaN NaN
       2   2   2   2   2   2   1   1   1   2   2   2   2   2   2 NaN
       2   1   1   1   1   1   1   1   1   1   1   1   1   1   2 NaN
       2   2   2   2   2   2   2   2   2   2   2   2   2   2   2 NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     ];
       hotspot = [9 8];

   case 'ddrag'
       cdata = [...
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
       2   2   2   2   2   2   2   2   2   2   2   2   2   2   2 NaN
       2   2   2   2   2   2   2   2   2   2   2   2   2   2   2 NaN
       2   2   2   2   2   2   2   2   2   2   2   2   2   2   2 NaN
     NaN NaN NaN   2   2   2   2   2   2   2   2   2 NaN NaN NaN NaN
     NaN NaN NaN NaN   2   2   2   2   2   2   2 NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN   2   2   2   2   2 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN   2   2   2 NaN NaN NaN NaN NaN NaN NaN
     NaN NaN NaN NaN NaN NaN NaN   2 NaN NaN NaN NaN NaN NaN NaN NaN
     ];
       hotspot = [9 8];


    case 'zoomin'
       cdata = [...
     NaN NaN NaN NaN   1   1   1   1   1   1 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN   1   1   2   2   2   2   1   1 NaN NaN NaN NaN NaN
     NaN NaN   1   1   2   2   2   2   2   2   1   1 NaN NaN NaN NaN
     NaN   1   1   2   2   2   1   1   2   2   2   1   1 NaN NaN NaN
     NaN   1   2   2   2   2   1   1   2   2   2   2   1 NaN NaN NaN
     NaN   1   2   2   1   1   1   1   1   1   2   2   1 NaN NaN NaN
     NaN   1   2   2   1   1   1   1   1   1   2   2   1 NaN NaN NaN
     NaN   1   2   2   2   2   1   1   2   2   2   2   1 NaN NaN NaN
     NaN   1   1   2   2   2   1   1   2   2   2   1   1 NaN NaN NaN
     NaN NaN   1   1   2   2   2   2   2   2   2   1 NaN NaN NaN NaN
     NaN NaN NaN   1   1   2   2   2   2   1   1   2   1 NaN NaN NaN
     NaN NaN NaN NaN   1   1   1   1   1   1 NaN   1   2   1 NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN   1   2   1 NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN   1   2   1
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN   1   1
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     ];
         hotspot = [6 5];

    case 'zoomout'
       cdata = [...
     NaN NaN NaN NaN   1   1   1   1   1   1 NaN NaN NaN NaN NaN NaN
     NaN NaN NaN   1   1   2   2   2   2   1   1 NaN NaN NaN NaN NaN
     NaN NaN   1   1   2   2   2   2   2   2   1   1 NaN NaN NaN NaN
     NaN   1   1   2   2   2   2   2   2   2   2   1   1 NaN NaN NaN
     NaN   1   2   2   2   2   2   2   2   2   2   2   1 NaN NaN NaN
     NaN   1   2   2   1   1   1   1   1   1   2   2   1 NaN NaN NaN
     NaN   1   2   2   1   1   1   1   1   1   2   2   1 NaN NaN NaN
     NaN   1   2   2   2   2   2   2   2   2   2   2   1 NaN NaN NaN
     NaN   1   1   2   2   2   2   2   2   2   2   1   1 NaN NaN NaN
     NaN NaN   1   1   2   2   2   2   2   2   2   1 NaN NaN NaN NaN
     NaN NaN NaN   1   1   2   2   2   2   1   1   2   1 NaN NaN NaN
     NaN NaN NaN NaN   1   1   1   1   1   1 NaN   1   2   1 NaN NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN   1   2   1 NaN
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN   1   2   1
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN   1   1
     NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
     ];
         hotspot = [6 5];

   case 'matlabdoc'
       cdata = [...
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       1   2   2   2   2   2   2   1   1   2   2   2   2   2   2   1
       1   2   2   2   2   2   2   1   1   2   2   2   2   2   2   1
       1   2   2   2   2   2   2   1   1   2   2   2   2   2   2   1
       1   2   2   2 NaN NaN NaN NaN NaN NaN NaN NaN   2   2   2   1
       1   2   2   2 NaN NaN NaN NaN NaN NaN NaN NaN   2   2   2   1
       1   2   2   2 NaN NaN NaN NaN NaN NaN NaN NaN   2   2   2   1
       1   1   1   1 NaN NaN NaN NaN NaN NaN NaN NaN   1   1   1   1
       1   1   1   1 NaN NaN NaN NaN NaN NaN NaN NaN   1   1   1   1
       1   2   2   2 NaN NaN NaN NaN NaN NaN NaN NaN   2   2   2   1
       1   2   2   2 NaN NaN NaN NaN NaN NaN NaN NaN   2   2   2   1
       1   2   2   2 NaN NaN NaN NaN NaN NaN NaN NaN   2   2   2   1
       1   2   2   2   2   2   2   1   1   2   2   2   2   2   2   1
       1   2   2   2   2   2   2   1   1   2   2   2   2   2   2   1
       1   2   2   2   2   2   2   1   1   2   2   2   2   2   2   1
       1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
       ];
         hotspot = [9 9];

    case 'none'

         cdata=repmat(nan,16,16);
         hotspot = [1 1];

    otherwise

       cdata=[];
       hotspot=[];

end
end