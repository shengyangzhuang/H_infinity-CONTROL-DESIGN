function [ ico ] = myIcons( name )

ico=ones(16,16,3);

%bg=[212/255 208/255 200/255];
bg=[NaN NaN NaN];

switch name

    case 'zoomIn'
        b=bg(1);
        r=[ b b b b 0 0 0 0 b b b b b b b b;
            b b 0 0 b b b b 0 0 b b b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            b 0 b b b 0 0 b b b 0 b b b b b;
            0 b b b b 0 0 b b b b 0 b b b b;
            0 b b 0 0 0 0 0 0 b b 0 b b b b;
            0 b b 0 0 0 0 0 0 b b 0 b b b b;
            0 b b b b 0 0 b b b b 0 b b b b;
            b 0 b b b 0 0 b b b 0 b b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            b b 0 0 b b b b 0 0 0 0 b b b b;
            b b b b 0 0 0 0 b b 0 0 0 b b b;
            b b b b b b b b b b b 0 0 0 b b;
            b b b b b b b b b b b b 0 0 0 b;
            b b b b b b b b b b b b b 0 0 b;
            b b b b b b b b b b b b b b b b];

        b=bg(2);
        g=[ b b b b 0 0 0 0 b b b b b b b b;
            b b 0 0 b b b b 0 0 b b b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            b 0 b b b 0 0 b b b 0 b b b b b;
            0 b b b b 0 0 b b b b 0 b b b b;
            0 b b 0 0 0 0 0 0 b b 0 b b b b;
            0 b b 0 0 0 0 0 0 b b 0 b b b b;
            0 b b b b 0 0 b b b b 0 b b b b;
            b 0 b b b 0 0 b b b 0 b b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            b b 0 0 b b b b 0 0 0 0 b b b b;
            b b b b 0 0 0 0 b b 0 0 0 b b b;
            b b b b b b b b b b b 0 0 0 b b;
            b b b b b b b b b b b b 0 0 0 b;
            b b b b b b b b b b b b b 0 0 b;
            b b b b b b b b b b b b b b b b];

        b=bg(3);
        c=.5;
        b=[ b b b b 0 0 0 0 b b b b b b b b;
            b b 0 0 b b b b 0 0 b b b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            b 0 b b b 0 0 b b b 0 b b b b b;
            0 b b b b 0 0 b b b b 0 b b b b;
            0 b b 0 0 0 0 0 0 b b 0 b b b b;
            0 b b 0 0 0 0 0 0 b b 0 b b b b;
            0 b b b b 0 0 b b b b 0 b b b b;
            b 0 b b b 0 0 b b b 0 b b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            b b 0 0 b b b b 0 0 c c b b b b;
            b b b b 0 0 0 0 b b c c c b b b;
            b b b b b b b b b b b c c c b b;
            b b b b b b b b b b b b c c c b;
            b b b b b b b b b b b b b c c b;
            b b b b b b b b b b b b b b b b];

            ico(:,:,1)=r;
            ico(:,:,2)=g;
            ico(:,:,3)=b;

    case 'zoomOut'
        b=bg(1);
        r=[ b b b b 0 0 0 0 b b b b b b b b;
            b b 0 0 b b b b 0 0 b b b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            0 b b b b b b b b b b 0 b b b b;
            0 b b 0 0 0 0 0 0 b b 0 b b b b;
            0 b b 0 0 0 0 0 0 b b 0 b b b b;
            0 b b b b b b b b b b 0 b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            b b 0 0 b b b b 0 0 0 0 b b b b;
            b b b b 0 0 0 0 b b 0 0 0 b b b;
            b b b b b b b b b b b 0 0 0 b b;
            b b b b b b b b b b b b 0 0 0 b;
            b b b b b b b b b b b b b 0 0 b;
            b b b b b b b b b b b b b b b b];

        b=bg(2);
        g=[ b b b b 0 0 0 0 b b b b b b b b;
            b b 0 0 b b b b 0 0 b b b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            0 b b b b b b b b b b 0 b b b b;
            0 b b 0 0 0 0 0 0 b b 0 b b b b;
            0 b b 0 0 0 0 0 0 b b 0 b b b b;
            0 b b b b b b b b b b 0 b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            b b 0 0 b b b b 0 0 0 0 b b b b;
            b b b b 0 0 0 0 b b 0 0 0 b b b;
            b b b b b b b b b b b 0 0 0 b b;
            b b b b b b b b b b b b 0 0 0 b;
            b b b b b b b b b b b b b 0 0 b;
            b b b b b b b b b b b b b b b b];

        b=bg(3);
        c=.5;
        b=[ b b b b 0 0 0 0 b b b b b b b b;
            b b 0 0 b b b b 0 0 b b b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            0 b b b b b b b b b b 0 b b b b;
            0 b b 0 0 0 0 0 0 b b 0 b b b b;
            0 b b 0 0 0 0 0 0 b b 0 b b b b;
            0 b b b b b b b b b b 0 b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            b 0 b b b b b b b b 0 b b b b b;
            b b 0 0 b b b b 0 0 c c b b b b;
            b b b b 0 0 0 0 b b c c c b b b;
            b b b b b b b b b b b c c c b b;
            b b b b b b b b b b b b c c c b;
            b b b b b b b b b b b b b c c b;
            b b b b b b b b b b b b b b b b];

            ico(:,:,1)=r;
            ico(:,:,2)=g;
            ico(:,:,3)=b;

	case 'realPole'
        b=bg(1);
        r=[ b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b 1 1 b b b b b b 1 1 b b b b;
            b b 1 1 1 b b b b 1 1 1 b b b b;
            b b b 1 1 1 b b 1 1 1 b b b b b;
            b b b b 1 1 1 1 1 1 b b b b b b;
            b b b b b 1 1 1 1 b b b b b b b;
            b b b b 1 1 1 1 1 1 b b b b b b;
            b b b 1 1 1 b b 1 1 1 b b b b b;
            b b 1 1 1 b b b b 1 1 1 b b b b;
            b b 1 1 b b b b b b 1 1 b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b];

        b=bg(2);
        g=[ b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b 0 0 b b b b b b 0 0 b b b b;
            b b 0 0 0 b b b b 0 0 0 b b b b;
            b b b 0 0 0 b b 0 0 0 b b b b b;
            b b b b 0 0 0 0 0 0 b b b b b b;
            b b b b b 0 0 0 0 b b b b b b b;
            b b b b 0 0 0 0 0 0 b b b b b b;
            b b b 0 0 0 b b 0 0 0 b b b b b;
            b b 0 0 0 b b b b 0 0 0 b b b b;
            b b 0 0 b b b b b b 0 0 b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b];

        b=bg(3);
        b=[ b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b 0 0 b b b b b b 0 0 b b b b;
            b b 0 0 0 b b b b 0 0 0 b b b b;
            b b b 0 0 0 b b 0 0 0 b b b b b;
            b b b b 0 0 0 0 0 0 b b b b b b;
            b b b b b 0 0 0 0 b b b b b b b;
            b b b b 0 0 0 0 0 0 b b b b b b;
            b b b 0 0 0 b b 0 0 0 b b b b b;
            b b 0 0 0 b b b b 0 0 0 b b b b;
            b b 0 0 b b b b b b 0 0 b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b];

            ico(:,:,1)=r;
            ico(:,:,2)=g;
            ico(:,:,3)=b;

	case 'realZero'
        b=bg(1);
        r=[ b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b 0 0 0 b b b b b b b;
            b b b b 0 0 0 0 0 0 0 b b b b b;
            b b b b 0 0 b b b 0 0 b b b b b;
            b b b 0 0 b b b b b 0 0 b b b b;
            b b b 0 0 b b b b b 0 0 b b b b;
            b b b 0 0 b b b b b 0 0 b b b b;
            b b b b 0 0 b b b 0 0 b b b b b;
            b b b b 0 0 0 0 0 0 0 b b b b b;
            b b b b b b 0 0 0 b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b];

        b=bg(2);
        g=[ b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b 0 0 0 b b b b b b b;
            b b b b 0 0 0 0 0 0 0 b b b b b;
            b b b b 0 0 b b b 0 0 b b b b b;
            b b b 0 0 b b b b b 0 0 b b b b;
            b b b 0 0 b b b b b 0 0 b b b b;
            b b b 0 0 b b b b b 0 0 b b b b;
            b b b b 0 0 b b b 0 0 b b b b b;
            b b b b 0 0 0 0 0 0 0 b b b b b;
            b b b b b b 0 0 0 b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b];

        b=bg(3);
        b=[ b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b 1 1 1 b b b b b b b;
            b b b b 1 1 1 1 1 1 1 b b b b b;
            b b b b 1 1 b b b 1 1 b b b b b;
            b b b 1 1 b b b b b 1 1 b b b b;
            b b b 1 1 b b b b b 1 1 b b b b;
            b b b 1 1 b b b b b 1 1 b b b b;
            b b b b 1 1 b b b 1 1 b b b b b;
            b b b b 1 1 1 1 1 1 1 b b b b b;
            b b b b b b 1 1 1 b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b];

            ico(:,:,1)=r;
            ico(:,:,2)=g;
            ico(:,:,3)=b;

	case 'complexPole'
        b=bg(1);
        r=[ b b b b b 1 b b b b 1 b b b b b;
            b b b b b b 1 b b 1 b b b b b b;
            b b b b b b b 1 1 b b b b b b b;
            b b b b b b b 1 1 b b b b b b b;
            b b b b b b 1 b b 1 b b b b b b;
            b b b b b 1 b b b b 1 b b b b b;
            b b b b b b b b b b b b b b b b;
            b b 0 0 0 0 0 0 0 0 0 0 0 0 b b;
            b b b b b b b b b b b b b b b b;
            b b b b b 1 b b b b 1 b b b b b;
            b b b b b b 1 b b 1 b b b b b b;
            b b b b b b b 1 1 b b b b b b b;
            b b b b b b b 1 1 b b b b b b b;
            b b b b b b 1 b b 1 b b b b b b;
            b b b b b 1 b b b b 1 b b b b b;
            b b b b b b b b b b b b b b b b];

        b=bg(2);
        g=[ b b b b b 0 b b b b 0 b b b b b;
            b b b b b b 0 b b 0 b b b b b b;
            b b b b b b b 0 0 b b b b b b b;
            b b b b b b b 0 0 b b b b b b b;
            b b b b b b 0 b b 0 b b b b b b;
            b b b b b 0 b b b b 0 b b b b b;
            b b b b b b b b b b b b b b b b;
            b b 0 0 0 0 0 0 0 0 0 0 0 0 b b;
            b b b b b b b b b b b b b b b b;
            b b b b b 0 b b b b 0 b b b b b;
            b b b b b b 0 b b 0 b b b b b b;
            b b b b b b b 0 0 b b b b b b b;
            b b b b b b b 0 0 b b b b b b b;
            b b b b b b 0 b b 0 b b b b b b;
            b b b b b 0 b b b b 0 b b b b b;
            b b b b b b b b b b b b b b b b];

        b=bg(3);
        b=[ b b b b b 0 b b b b 0 b b b b b;
            b b b b b b 0 b b 0 b b b b b b;
            b b b b b b b 0 0 b b b b b b b;
            b b b b b b b 0 0 b b b b b b b;
            b b b b b b 0 b b 0 b b b b b b;
            b b b b b 0 b b b b 0 b b b b b;
            b b b b b b b b b b b b b b b b;
            b b 0 0 0 0 0 0 0 0 0 0 0 0 b b;
            b b b b b b b b b b b b b b b b;
            b b b b b 0 b b b b 0 b b b b b;
            b b b b b b 0 b b 0 b b b b b b;
            b b b b b b b 0 0 b b b b b b b;
            b b b b b b b 0 0 b b b b b b b;
            b b b b b b 0 b b 0 b b b b b b;
            b b b b b 0 b b b b 0 b b b b b;
            b b b b b b b b b b b b b b b b];

            ico(:,:,1)=r;
            ico(:,:,2)=g;
            ico(:,:,3)=b;

	case 'complexZero'
        b=bg(1);
        r=[ b b b b b b 0 0 0 b b b b b b b;
            b b b b b 0 b b b 0 b b b b b b;
            b b b b b 0 b b b 0 b b b b b b;
            b b b b b 0 b b b 0 b b b b b b;
            b b b b b b 0 0 0 b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b 0 0 0 0 0 0 0 0 0 0 0 0 b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b 0 0 0 b b b b b b b;
            b b b b b 0 b b b 0 b b b b b b;
            b b b b b 0 b b b 0 b b b b b b;
            b b b b b 0 b b b 0 b b b b b b;
            b b b b b b 0 0 0 b b b b b b b;
            b b b b b b b b b b b b b b b b];

        b=bg(2);
        g=[ b b b b b b 0 0 0 b b b b b b b;
            b b b b b 0 b b b 0 b b b b b b;
            b b b b b 0 b b b 0 b b b b b b;
            b b b b b 0 b b b 0 b b b b b b;
            b b b b b b 0 0 0 b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b 0 0 0 0 0 0 0 0 0 0 0 0 b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b 0 0 0 b b b b b b b;
            b b b b b 0 b b b 0 b b b b b b;
            b b b b b 0 b b b 0 b b b b b b;
            b b b b b 0 b b b 0 b b b b b b;
            b b b b b b 0 0 0 b b b b b b b;
            b b b b b b b b b b b b b b b b];

        b=bg(3);
        b=[ b b b b b b 1 1 1 b b b b b b b;
            b b b b b 1 b b b 1 b b b b b b;
            b b b b b 1 b b b 1 b b b b b b;
            b b b b b 1 b b b 1 b b b b b b;
            b b b b b b 1 1 1 b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b 0 0 0 0 0 0 0 0 0 0 0 0 b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            b b b b b b 1 1 1 b b b b b b b;
            b b b b b 1 b b b 1 b b b b b b;
            b b b b b 1 b b b 1 b b b b b b;
            b b b b b 1 b b b 1 b b b b b b;
            b b b b b b 1 1 1 b b b b b b b;
            b b b b b b b b b b b b b b b b];

            ico(:,:,1)=r;
            ico(:,:,2)=g;
            ico(:,:,3)=b;

	case 'erase'
        b=bg(1);
        r=[ b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            0 0 0 0 0 0 0 b b b b b b b b b;
            0 0 1 1 1 1 1 0 b b b b b b b b;
            0 1 0 1 1 1 1 1 0 b b b b b b b;
            0 1 1 0 1 1 1 1 1 0 b b b b b b;
            b 0 1 1 0 1 1 1 1 1 0 b b b b b;
            b b 0 1 1 0 1 1 1 1 1 0 b b b b;
            b b b 0 1 1 0 1 1 1 1 1 0 b b b;
            b b b b 0 1 1 0 1 1 1 1 1 0 b b;
            b b b b b 0 1 1 0 1 1 1 1 1 0 b;
            b b b b b b 0 1 1 0 0 0 0 0 0 0;
            b b b b b b b 0 1 0 1 1 1 1 1 0;
            b b b b b b b b 0 0 0 0 0 0 0 0;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b];

        b=bg(2);
        g=[ b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            0 0 0 0 0 0 0 b b b b b b b b b;
            0 0 1 1 1 1 1 0 b b b b b b b b;
            0 1 0 1 1 1 1 1 0 b b b b b b b;
            0 1 1 0 1 1 1 1 1 0 b b b b b b;
            b 0 1 1 0 1 1 1 1 1 0 b b b b b;
            b b 0 1 1 0 1 1 1 1 1 0 b b b b;
            b b b 0 1 1 0 1 1 1 1 1 0 b b b;
            b b b b 0 1 1 0 1 1 1 1 1 0 b b;
            b b b b b 0 1 1 0 1 1 1 1 1 0 b;
            b b b b b b 0 1 1 0 0 0 0 0 0 0;
            b b b b b b b 0 1 0 1 1 1 1 1 0;
            b b b b b b b b 0 0 0 0 0 0 0 0;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b];

        b=bg(3);
        b=[ b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b;
            0 0 0 0 0 0 0 b b b b b b b b b;
            0 0 1 1 1 1 1 0 b b b b b b b b;
            0 1 0 1 1 1 1 1 0 b b b b b b b;
            0 1 1 0 1 1 1 1 1 0 b b b b b b;
            b 0 1 1 0 1 1 1 1 1 0 b b b b b;
            b b 0 1 1 0 1 1 1 1 1 0 b b b b;
            b b b 0 1 1 0 1 1 1 1 1 0 b b b;
            b b b b 0 1 1 0 1 1 1 1 1 0 b b;
            b b b b b 0 1 1 0 1 1 1 1 1 0 b;
            b b b b b b 0 1 1 0 0 0 0 0 0 0;
            b b b b b b b 0 1 0 1 1 1 1 1 0;
            b b b b b b b b 0 0 0 0 0 0 0 0;
            b b b b b b b b b b b b b b b b;
            b b b b b b b b b b b b b b b b];

            ico(:,:,1)=r;
            ico(:,:,2)=g;
            ico(:,:,3)=b;

	case 'hand'
        b=bg(1);
        r=[ b b b b b b b 0 0 b b b b b b b;
            b b b 0 0 b 0 1 1 0 0 0 b b b b;
            b b 0 1 1 0 0 1 1 0 1 1 0 b b b;
            b b 0 1 1 0 0 1 1 0 1 1 0 b 0 b;
            b b b 0 1 1 0 1 1 0 1 1 0 0 1 0;
            b b b 0 1 1 0 1 1 0 1 1 0 1 1 0;
            b 0 0 b 0 1 1 1 1 1 1 1 1 1 1 0;
            0 1 1 0 0 1 1 1 1 1 1 1 1 1 1 0;
            0 1 1 1 0 1 1 1 1 1 1 1 1 1 0 b;
            b 0 1 1 1 1 1 1 1 1 1 1 1 1 0 b;
            b b 0 1 1 1 1 1 1 1 1 1 1 1 0 b;
            b b 0 1 1 1 1 1 1 1 1 1 1 0 b b;
            b b b 0 1 1 1 1 1 1 1 1 1 0 b b;
            b b b b 0 1 1 1 1 1 1 1 0 b b b;
            b b b b b 0 1 1 1 1 1 1 0 b b b;
            b b b b b 0 1 1 1 1 1 1 0 b b b];

        b=bg(2);
        g=[ b b b b b b b 0 0 b b b b b b b;
            b b b 0 0 b 0 1 1 0 0 0 b b b b;
            b b 0 1 1 0 0 1 1 0 1 1 0 b b b;
            b b 0 1 1 0 0 1 1 0 1 1 0 b 0 b;
            b b b 0 1 1 0 1 1 0 1 1 0 0 1 0;
            b b b 0 1 1 0 1 1 0 1 1 0 1 1 0;
            b 0 0 b 0 1 1 1 1 1 1 1 1 1 1 0;
            0 1 1 0 0 1 1 1 1 1 1 1 1 1 1 0;
            0 1 1 1 0 1 1 1 1 1 1 1 1 1 0 b;
            b 0 1 1 1 1 1 1 1 1 1 1 1 1 0 b;
            b b 0 1 1 1 1 1 1 1 1 1 1 1 0 b;
            b b 0 1 1 1 1 1 1 1 1 1 1 0 b b;
            b b b 0 1 1 1 1 1 1 1 1 1 0 b b;
            b b b b 0 1 1 1 1 1 1 1 0 b b b;
            b b b b b 0 1 1 1 1 1 1 0 b b b;
            b b b b b 0 1 1 1 1 1 1 0 b b b];

        b=bg(3);
        b=[ b b b b b b b 0 0 b b b b b b b;
            b b b 0 0 b 0 1 1 0 0 0 b b b b;
            b b 0 1 1 0 0 1 1 0 1 1 0 b b b;
            b b 0 1 1 0 0 1 1 0 1 1 0 b 0 b;
            b b b 0 1 1 0 1 1 0 1 1 0 0 1 0;
            b b b 0 1 1 0 1 1 0 1 1 0 1 1 0;
            b 0 0 b 0 1 1 1 1 1 1 1 1 1 1 0;
            0 1 1 0 0 1 1 1 1 1 1 1 1 1 1 0;
            0 1 1 1 0 1 1 1 1 1 1 1 1 1 0 b;
            b 0 1 1 1 1 1 1 1 1 1 1 1 1 0 b;
            b b 0 1 1 1 1 1 1 1 1 1 1 1 0 b;
            b b 0 1 1 1 1 1 1 1 1 1 1 0 b b;
            b b b 0 1 1 1 1 1 1 1 1 1 0 b b;
            b b b b 0 1 1 1 1 1 1 1 0 b b b;
            b b b b b 0 1 1 1 1 1 1 0 b b b;
            b b b b b 0 1 1 1 1 1 1 0 b b b];

            ico(:,:,1)=r;
            ico(:,:,2)=g;
            ico(:,:,3)=b;

    case 'arrow'
        b=bg(1);
        r=[ b b b 0 b b b b b b b b b b b b;
            b b b 0 0 b b b b b b b b b b b;
            b b b 0 1 0 b b b b b b b b b b;
            b b b 0 1 1 0 b b b b b b b b b;
            b b b 0 1 1 1 0 b b b b b b b b;
            b b b 0 1 1 1 1 0 b b b b b b b;
            b b b 0 1 1 1 1 1 0 b b b b b b;
            b b b 0 1 1 1 1 1 1 0 b b b b b;
            b b b 0 1 1 1 1 0 0 0 0 b b b b;
            b b b 0 1 1 0 1 0 b b b b b b b;
            b b b 0 1 0 0 1 1 0 b b b b b b;
            b b b 0 0 b b 0 1 0 b b b b b b;
            b b b 0 b b b 0 1 1 0 b b b b b;
            b b b b b b b b 0 1 0 b b b b b;
            b b b b b b b b 0 0 b b b b b b;
            b b b b b b b b b b b b b b b b];

        b=bg(2);
        g=[ b b b 0 b b b b b b b b b b b b;
            b b b 0 0 b b b b b b b b b b b;
            b b b 0 1 0 b b b b b b b b b b;
            b b b 0 1 1 0 b b b b b b b b b;
            b b b 0 1 1 1 0 b b b b b b b b;
            b b b 0 1 1 1 1 0 b b b b b b b;
            b b b 0 1 1 1 1 1 0 b b b b b b;
            b b b 0 1 1 1 1 1 1 0 b b b b b;
            b b b 0 1 1 1 1 0 0 0 0 b b b b;
            b b b 0 1 1 0 1 0 b b b b b b b;
            b b b 0 1 0 0 1 1 0 b b b b b b;
            b b b 0 0 b b 0 1 0 b b b b b b;
            b b b 0 b b b 0 1 1 0 b b b b b;
            b b b b b b b b 0 1 0 b b b b b;
            b b b b b b b b 0 0 b b b b b b;
            b b b b b b b b b b b b b b b b];

        b=bg(3);
        b=[ b b b 0 b b b b b b b b b b b b;
            b b b 0 0 b b b b b b b b b b b;
            b b b 0 1 0 b b b b b b b b b b;
            b b b 0 1 1 0 b b b b b b b b b;
            b b b 0 1 1 1 0 b b b b b b b b;
            b b b 0 1 1 1 1 0 b b b b b b b;
            b b b 0 1 1 1 1 1 0 b b b b b b;
            b b b 0 1 1 1 1 1 1 0 b b b b b;
            b b b 0 1 1 1 1 0 0 0 0 b b b b;
            b b b 0 1 1 0 1 0 b b b b b b b;
            b b b 0 1 0 0 1 1 0 b b b b b b;
            b b b 0 0 b b 0 1 0 b b b b b b;
            b b b 0 b b b 0 1 1 0 b b b b b;
            b b b b b b b b 0 1 0 b b b b b;
            b b b b b b b b 0 0 b b b b b b;
            b b b b b b b b b b b b b b b b];

            ico(:,:,1)=r;
            ico(:,:,2)=g;
            ico(:,:,3)=b;

end

end