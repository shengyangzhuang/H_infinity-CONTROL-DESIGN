function WeightEditor( weight,output )

    output('setInput',@input);

	switch weight
        case 'S'
            title='Ws Pole-Zero-diagram';
        case 'T'
            title='Wt Pole-Zero-diagram';
        case 'U'
            title='Wu Pole-Zero-diagram';
        otherwise
            return;
    end

    f=figure('CloseRequestFcn',{@closeFcn},...
             'Name',title,...
             'MenuBar','none',...
             'ToolBar','none',...
             'NumberTitle','off',...
             'Units','normalized',...
             'Position',[0.6 0.5 0.4 0.55]);
	movegui(f,'onscreen');

	fPointer='arrow';
	setPointer(fPointer);

	tb=uitoolbar(f);
	uipushtool(tb,'CData',myIcons('realPole'),...
				'ClickedCallback',{@toolBarCallback, 'realPole'});
    uipushtool(tb,'CData',myIcons('complexPole'),...
				'ClickedCallback',{@toolBarCallback, 'complexPole'});
    uipushtool(tb,'CData',myIcons('realZero'),...
				'ClickedCallback',{@toolBarCallback, 'realZero'});
    uipushtool(tb,'CData',myIcons('complexZero'),...
				'ClickedCallback',{@toolBarCallback, 'complexZero'});
    uipushtool(tb,'CData',myIcons('hand'),...
				'ClickedCallback',{@toolBarCallback, 'hand'});
    uipushtool(tb,'CData',myIcons('erase'),...
				'ClickedCallback',{@toolBarCallback, 'erase'});
    %uipushtool(tb,'CData',myIcons('zoomIn'),...
	%			'ClickedCallback',{@toolBarCallback, 'zoomIn'});
    %uipushtool(tb,'CData',myIcons('zoomOut'),...
	%			'ClickedCallback',{@toolBarCallback, 'zoomOut'});
    uipushtool(tb,'CData',myIcons('arrow'),...
				'ClickedCallback',{@toolBarCallback, 'arrow'});

	a=axes('DataAspectRatio',[1 1 1],...
	        'Units','normalized',...
            'Position',[0.05 0.25 0.9 0.7],...
            'XGrid','off',...
            'YGrid','off',...
            'Units','normalized',...
            'YLimMode','manual',...
            'YLim',[-10 10],'XLim',[-10 10],...
            'DrawMode','fast');
	xlabel('Re');
    ylabel('Im');
    hold on;

	reAx=plot([-10 10],[0 0],'black');
	imAx=plot([0 0],[-10 10],'black');
	imAx=plot([0 0],[-10 10],'black');

	pPlot=plot(1,1,'x');
	set(pPlot,'XData',[],...
			'YData',[],...
			'Color',[1 0 0]);

	zPlot=plot(1,1,'o');
    set(zPlot,'XData',[],...
            'YData',[],...
            'Color',[0 0 1]);

	output('updatePZData');
    rescale();

    function input(action,varargin)
        switch lower(action)
			case 'updatepzdata'
				vai1=varargin{1};
				vai2=varargin{2};
				set(pPlot,'XData',real(vai1{1}),'YData',imag(vai1{1}));
				set(zPlot,'XData',real(vai2{1}),'YData',imag(vai2{1}));
				rescale();
			case 'illegalpolemove'
				movedPZ();
				warnString=['A pole in the right half plane will yeild a ustable weight, which is not allowed'];
				warndlg(warnString,'Unable to move pole/poles');
			case 'close'
				closeFcn();
        end
    end

	function toolBarCallback(src,eventdata,tool)
		switch tool
			case 'realPole'
				fPointer='addPole';
				set(a,'ButtonDownFcn',{@addRealPole});
				set(pPlot,'ButtonDownFcn','');
				set(zPlot,'ButtonDownFcn','');
			case 'complexPole'
				fPointer='addDoublePole';
				set(a,'ButtonDownFcn',{@addComplexPole});
				set(pPlot,'ButtonDownFcn','');
				set(zPlot,'ButtonDownFcn','');
			case 'realZero'
				fPointer='addZero';
				set(a,'ButtonDownFcn',{@addRealZero});
				set(pPlot,'ButtonDownFcn','');
				set(zPlot,'ButtonDownFcn','');
			case 'complexZero'
				fPointer='addDoubleZero';
				set(a,'ButtonDownFcn',{@addComplexZero});
				set(pPlot,'ButtonDownFcn','');
				set(zPlot,'ButtonDownFcn','');
			case 'hand'
				fPointer='hand';
				set(a,'ButtonDownFcn','');
				set(pPlot,'ButtonDownFcn',{@movePZ,'p'});
				set(zPlot,'ButtonDownFcn',{@movePZ,'z'});
			case 'erase'
				fPointer='eraser';
				set(a,'ButtonDownFcn','');
				set(pPlot,'ButtonDownFcn',{@removePZ,'p'});
				set(zPlot,'ButtonDownFcn',{@removePZ,'z'});
			case 'zoomIn'
				fPointer='zoomin';
				set(a,'ButtonDownFcn',{@zoomIn});
				set(pPlot,'ButtonDownFcn','');
				set(zPlot,'ButtonDownFcn','');
			case 'zoomOut'
				fPointer='zoomout';
				set(a,'ButtonDownFcn',{@zoomOut});
				set(pPlot,'ButtonDownFcn','');
				set(zPlot,'ButtonDownFcn','');
			case 'arrow'
				fPointer='arrow';
				set(a,'ButtonDownFcn','');
				set(pPlot,'ButtonDownFcn','');
				set(zPlot,'ButtonDownFcn','');
			otherwise
				return;
		end
		setPointer(fPointer)
	end

    function setPointer(ptr)
        [cdata,hotspot]=myPointers(ptr);
        set(f,'Pointer','custom' , ...
			'PointerShapeCData',cdata, ...
			'PointerShapeHotSpot',hotspot);
    end

    function rescale()
        scale=1.5*max(abs( [get(pPlot,'XData') get(pPlot,'YData') get(zPlot,'XData') get(zPlot,'YData')] ));
        if isempty(scale), scale=10; end
        set(a,'XLim',[-scale scale],'YLim',[-scale scale]);
		set(reAx,'XData',[-scale scale]);
		set(imAx,'YData',[-scale scale]);
    end

	function addRealPole(src,eventdata)
		location=get(a,'CurrentPoint');
		x=location(1,1);
		output('addRealPole',x);
	end

	function addRealZero(src,eventdata)
		location=get(a,'CurrentPoint');
		x=location(1,1);
		output('addRealZero',x);
	end

	function addComplexPole(src,eventdata)
		location=get(a,'CurrentPoint');
		x=location(1,1);
		y=location(1,2);
		output('addComplexPole',x,y);
	end

	function addComplexZero(src,eventdata)
		location=get(a,'CurrentPoint');
		x=location(1,1);
		y=location(1,2);
		output('addComplexZero',x,y);
	end

	function removePZ(src,eventdata,pORz)
		location=get(a,'CurrentPoint');
		location=[location(1,1) location(1,2)];
		switch pORz
			case 'p'
				xData=get(pPlot,'XData');
				yData=get(pPlot,'YData');
			case 'z'
				xData=get(zPlot,'XData');
				yData=get(zPlot,'YData');
		end
		dx2=(location(1,1)*ones(size(xData))-xData).^2;
		dy2=(location(1,2)*ones(size(yData))-yData).^2;
		r2=dx2+dy2;
		[val,ind]=min(r2);
		switch pORz
			case 'p'
				output('removePole',xData(ind),yData(ind));
			case 'z'
				output('removeZero',xData(ind),yData(ind));
		end
		rescale();
	end



	function movePZ(src,eventdata,pORz)
		location=get(a,'CurrentPoint');
		location=[location(1,1) location(1,2)];
		switch pORz
			case 'p'
				xData=get(pPlot,'XData');
				yData=get(pPlot,'YData');
			case 'z'
				xData=get(zPlot,'XData');
				yData=get(zPlot,'YData');
		end
		dx2=(location(1,1)*ones(size(xData))-xData).^2;
		dy2=(location(1,2)*ones(size(yData))-yData).^2;
		r2=dx2+dy2;
		[val,ind]=min(r2);
		setPointer('closedhand');
		set(f,...
			'WindowButtonMotionFcn',{@movingPZ,pORz,ind},...
			'WindowButtonUpFcn',{@movedPZ});
	end

	function movingPZ(src,eventdata,pORz,ind)
		location=get(a,'CurrentPoint');
		location=[location(1,1) location(1,2)];
		switch pORz
			case 'p'
				output('movePole',ind,location(1),location(2));
			case 'z'
				output('moveZero',ind,location(1),location(2));
		end
	end

	function movedPZ(src,eventdata)
		set(f,...
			'WindowButtonMotionFcn','',...
			'WindowButtonUpFcn','');
		rescale();
		output('updateYScale');
		%output('updateController');
		setPointer(fPointer);
	end

	function zoomIn(src,eventdata)
		disp('zoomIn')
	end

	function zoomOut(src,eventdata)
		disp('zoomOut')
	end

	function closeFcn(src,eventdata)
		output('close');
		delete(f);
		clear all;
    end

end