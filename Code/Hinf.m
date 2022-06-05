function Hinf( varargin )

	if nargin >= 1
		G=varargin{1};
	else
		return;
    end
	p=get(zpk(G),'p');
	pmax=max(real( [ -1 ; p{1} ] ));
		if pmax >= 0
			disp('The system must be stable');
			return;
		end


%------------Model components------------------------

	s=tf('s');

    Ws=zpk(1/(s+1));
    if nargin >= 2
        Ws = zpk(varargin{2});
    end
    Wt=zpk(1/(s+1));
    if nargin >= 3
        Wt = zpk(varargin{3});

    end
    Wu=zpk(1/(s+1));
    if nargin >= 4
        Wu = zpk(varargin{4});
    end

    F=tf(1);

    S=inv(1+G*F);
    T=G*F*inv(1+G*F);
    U=F*inv(1+G*F);

    enable.T=1;
    enable.U=1;

%--------------GUI components------------------------

    f=figure('Name','H-infinity design tool',...
		'MenuBar','none',...
        'ToolBar','none',...
        'NumberTitle','off',...
        'Units','normalized',...
        'Position',[0.05 0.05 0.9 0.9]);

	%set(f,'KeyPressFcn',@myFunction);
	%function myFunction(src,eventdata)
	%	if strcmp(eventdata.Key,'e')
	%	%disp(eventdata.Key);
	%	disp(eventdata.Modifier);
	%	set(f,'KeyPressFcn','');
	%	set(f,'KeyReleaseFcn','');
	%	end
	%end

	controllerMenu=uimenu('Label','Controller');
	uimenu('Label','Compute Controller',...
			'Parent',controllerMenu,...
			'Callback',{@computeController});
	uimenu('Label','Export to workspace',...
		'Parent',controllerMenu,...
		'Callback',{@exportController});

	controllerMenu=uimenu('Label','Plots');
	uimenu('Label','Auto-set frequency',...
			'Parent',controllerMenu,...
			'Callback',{@autoSetFrequency});



%---------------Ws---------------------

    uicontrol('Style','text',...
        'String','Ws',...
        'FontUnits','normalized',...
        'FontSize',.9,...
        'FontWeight','bold',...
        'BackgroundColor',[204/256 204/256 204/256],...
        'Units','normalized',...
        'Position',[0.05 0.96 0.1 0.03]);

    [mag,phase,ws] = bode(inv(Ws));

    wsBode=axes(...
        'Position',[0.05 0.75 0.6 0.2],...
    	'Xscale','log','Yscale','log',...
        'XGrid','on',...
        'YGrid','off',...
        'GridLineStyle','--',...
        'Units','normalized',...
        'YLimMode','manual',...
    	'YLim',[0.5 2],'XLim',[ws(1) ws(end)],...
    	'DrawMode','fast');

    xlabel('\omega (rad/s)');
    ylabel('Magnitude (dB)');
    hold on;

    sPlot=plot([1 2],[1 2],'r');
    wsPlot=plot(ws,ones(size(ws)),'black');

 	legend('|S|','W_S^{-1}','Location', 'southeast' );

    wsPatch=patch([ws; ws(end); ws(1)],[ones(size(ws)); 2; 2],'b',...
        'FaceColor', [0.9 0.9 1], 'FaceAlpha', 0.2,...
        'EdgeColor', 'none');

    set(wsPatch,'FaceAlpha',0.2);
    set(sPlot,'XData',[],'YData',[]);
    set(wsPlot,'XData',[],'YData',[]);

    wsMin=uicontrol('Style','edit',...
        'String',num2str(ws(1)),...
        'Units','normalized',...
        'Position',[0.05 0.68 0.07 0.03],...
        'Callback',{@wMinCallback,'S'},...
        'TooltipString','Minimum frequency in plot (rad/s)');

    wsMax=uicontrol('Style','edit',...
        'String',num2str(ws(end)),...
        'Units','normalized',...
        'Position',[0.58 0.68 0.07 0.03],...
        'Callback',{@wMaxCallback,'S'},...
        'TooltipString','Maximum frequency in plot (rad/s)');

    wsPoleHeadLine=uicontrol('Style','text',...
        'String','Poles (0)',...
        'FontUnits','normalized',...
        'FontSize',.9,...
        'BackgroundColor',[204/256 204/256 204/256],...
        'ForegroundColor',[1 0 0],...
        'Units','normalized',...
        'Position',[0.7 0.94 0.15 0.03]);

	wsPoleList=uicontrol('Style','listbox',...
		'Max',1,'Min',1,...
        'Units','normalized',...
        'Position',[0.7 0.83 0.15 0.11]);

	wsZeroHeadLine=uicontrol('Style','text',...
        'String','Zeros (0)',...
        'FontUnits','normalized',...
        'FontSize',.9,...
        'BackgroundColor',[204/256 204/256 204/256],...
        'ForegroundColor',[0 0 1],...
        'Units','normalized',...
        'Position',[0.85 0.94 0.15 0.03]);

    wsZeroList=uicontrol('Style','listbox',...
		'Max',1,'Min',1,...
        'Units','normalized',...
        'Position',[0.85 0.77 0.15 0.17]);

    uicontrol('Style','pushbutton',...
        'String','Add real pole',...
        'Units','normalized',...
        'Position',[0.7 0.8 0.15 0.03],...
		'Callback',{@addDLG,1});

    uicontrol('Style','pushbutton',...
        'String','Add complex pole pair',...
        'Units','normalized',...
        'Position',[0.7 0.77 0.15 0.03],...
		'Callback',{@addDLG,9});

	uicontrol('Style','pushbutton',...
        'String','Remove pole/poles',...
        'Units','normalized',...
        'Position',[0.7 0.74 0.15 0.03],...
		'Callback',{@removeCallback,'S','p'});

    uicontrol('Style','pushbutton',...
        'String','Add real zero',...
        'Units','normalized',...
        'Position',[0.85 0.8 0.15 0.03],...
		'Callback',{@addDLG,5});

    uicontrol('Style','pushbutton',...
        'String','Add complex zero pair',...
        'Units','normalized',...
        'Position',[0.85 0.77 0.15 0.03],...
		'Callback',{@addDLG,13});

	uicontrol('Style','pushbutton',...
        'String','Remove zero/zeros',...
        'Units','normalized',...
        'Position',[0.85 0.74 0.15 0.03],...
		'Callback',{@removeCallback,'S','z'});

	uicontrol('Style','pushbutton',...
        'String','Edit Pole-Zero diagram',...
        'Units','normalized',...
        'Position',[0.7 0.71 0.3 0.03],...
        'Callback',{@editPZ,'S'});

	uicontrol('Style','text',...
        'String','Gain: ',...
        'FontUnits','normalized',...
        'FontSize',.9,...
        'BackgroundColor',[204/256 204/256 204/256],...
        'ForegroundColor',[0 0 0],...
        'Units','normalized',...
        'Position',[0.7 0.68 0.04 0.02]);

	sGainEdit=uicontrol('Style','edit',...
        'String',num2str(get(Ws,'k')),...
        'Units','normalized',...
        'Position',[0.74 0.68 0.1 0.02],...
        'Callback',{@gainCallback,'S'});

%---------------Wt---------------------

	uicontrol('Style','text',...
        'String','Wt',...
        'FontUnits','normalized',...
        'FontSize',.9,...
        'FontWeight','bold',...
        'BackgroundColor',[204/256 204/256 204/256],...
        'Units','normalized',...
        'Position',[0.05 0.64 0.1 0.03]);

	enableTButton=uicontrol('Style','pushbutton',...
        'String','Disable',...
        'Units','normalized',...
        'Position',[0.15 0.64 0.1 0.03],...
		'Callback',{@enableWeight,'T'});

    [mag,phase,wt] = bode(inv(tf(Wt)));

    wtBode=axes(...
        'Position',[0.05 0.43 0.6 0.2],...
    	'Xscale','log','Yscale','log',...
        'XGrid','on',...
        'YGrid','off',...
        'GridLineStyle','--',...
        'Units','normalized',...
        'YLimMode','manual',...
    	'YLim',[0.5 2],'XLim',[wt(1) wt(end)],...
    	'DrawMode','fast');
    xlabel('\omega (rad/s)');
    ylabel('Magnitude (dB)');
    hold on;

    tPlot=plot([1 2],[1 2],'g');
    wtPlot=plot(wt,ones(size(wt)),'black');

    legend('|T|','W_T^{-1}','Location', 'southeast');

    wtPatch=patch([wt; wt(end); wt(1)],[ones(size(wt)); 2; 2],'b',...
        'FaceColor', [0.9 0.9 1], 'FaceAlpha', 0.2,...
        'EdgeColor', 'none');

    set(wtPatch,'FaceAlpha',0.2);
    set(tPlot,'XData',[],'YData',[]);
    set(wtPlot,'XData',[],'YData',[]);

	wtMin=uicontrol('Style','edit',...
        'String',num2str(wt(1)),...
        'Units','normalized',...
        'Position',[0.05 0.36 0.07 0.03],...
        'Callback',{@wMinCallback,'T'},...
        'TooltipString','Minimum frequency in plot (rad/s)');

    wtMax=uicontrol('Style','edit',...
        'String',num2str(wt(end)),...
        'Units','normalized',...
        'Position',[0.58 0.36 0.07 0.03],...
        'Callback',{@wMaxCallback,'T'},...
        'TooltipString','Maximum frequency in plot (rad/s)');

    wtPoleHeadLine=uicontrol('Style','text',...
        'String','Poles (0)',...
        'FontUnits','normalized',...
        'FontSize',.9,...
        'BackgroundColor',[204/256 204/256 204/256],...
        'ForegroundColor',[1 0 0],...
        'Units','normalized',...
        'Position',[0.7 0.62 0.15 0.03]);

    wtPoleList=uicontrol('Style','listbox',...
		'Max',1,'Min',1,...
        'Units','normalized',...
        'Position',[0.7 0.45 0.15 0.17]);

    wtZeroHeadLine=uicontrol('Style','text',...
        'String','Zeros (0)',...
        'FontUnits','normalized',...
        'FontSize',.9,...
        'BackgroundColor',[204/256 204/256 204/256],...
        'ForegroundColor',[0 0 1],...
        'Units','normalized',...
        'Position',[0.85 0.62 0.15 0.03]);

    wtZeroList=uicontrol('Style','listbox',...
		'Max',1,'Min',1,...
        'Units','normalized',...
        'Position',[0.85 0.45 0.15 0.17]);

    uicontrol('Style','pushbutton',...
        'String','Add real pole',...
        'Units','normalized',...
        'Position',[0.7 0.48 0.15 0.03],...
		'Callback',{@addDLG,2});

    uicontrol('Style','pushbutton',...
        'String','Add complex pole pair',...
        'Units','normalized',...
        'Position',[0.7 0.45 0.15 0.03],...
		'Callback',{@addDLG,10});

	uicontrol('Style','pushbutton',...
        'String','Remove pole/poles',...
        'Units','normalized',...
        'Position',[0.7 0.42 0.15 0.03],...
		'Callback',{@removeCallback,'T','p'});

    uicontrol('Style','pushbutton',...
        'String','Add real zero',...
        'Units','normalized',...
        'Position',[0.85 0.48 0.15 0.03],...
		'Callback',{@addDLG,6});

    uicontrol('Style','pushbutton',...
        'String','Add complex zero pair',...
        'Units','normalized',...
        'Position',[0.85 0.45 0.15 0.03],...
		'Callback',{@addDLG,14});

	uicontrol('Style','pushbutton',...
        'String','Remove zero/zeros',...
        'Units','normalized',...
        'Position',[0.85 0.42 0.15 0.03],...
		'Callback',{@removeCallback,'T','z'});

	uicontrol('Style','pushbutton',...
        'String','Edit Pole-Zero diagram',...
        'Units','normalized',...
        'Position',[0.7 0.39 0.3 0.03],...
        'Callback',{@editPZ,'T'});

	uicontrol('Style','text',...
        'String','Gain: ',...
        'FontUnits','normalized',...
        'FontSize',.9,...
        'BackgroundColor',[204/256 204/256 204/256],...
        'ForegroundColor',[0 0 0],...
        'Units','normalized',...
        'Position',[0.7 0.36 0.04 0.02]);

	tGainEdit=uicontrol('Style','edit',...
        'String',num2str(get(Wt,'k')),...
        'Units','normalized',...
        'Position',[0.74 0.36 0.1 0.02],...
        'Callback',{@gainCallback,'T'});


%---------------Wu---------------------

	uicontrol('Style','text',...
        'String','Wu',...
        'FontUnits','normalized',...
        'FontSize',.9,...
        'FontWeight','bold',...
        'BackgroundColor',[204/256 204/256 204/256],...
        'Units','normalized',...
        'Position',[0.05 0.32 0.1 0.03]);

	enableUButton=uicontrol('Style','pushbutton',...
        'String','Disable',...
        'Units','normalized',...
        'Position',[0.15 0.32 0.1 0.03],...
		'Callback',{@enableWeight,'U'});

    [mag,phase,wu] = bode(inv(tf(Wu)));

    wuBode=axes(...
        'Position',[0.05 0.11 0.6 0.2],...
    	'Xscale','log','Yscale','log',...
        'XGrid','on',...
        'YGrid','off',...
        'GridLineStyle','--',...
        'Units','normalized',...
        'YLimMode','manual',...
    	'YLim',[0.5 2],'XLim',[wu(1) wu(end)],...
    	'DrawMode','fast');
    xlabel('\omega (rad/s)');
    ylabel('Magnitude (dB)');
    hold on;

    uPlot=plot([1 2],[1 2],'b');
    wuPlot=plot(wu,ones(size(wu)),'black');

    legend('|U|','W_U^{-1}','Location', 'southeast');

    wuPatch=patch([wu; wu(end); wu(1)],[ones(size(wu)); 2; 2],'b',...
        'FaceColor', [0.9 0.9 1], 'FaceAlpha', 0.2,...
        'EdgeColor', 'none');

    set(wuPatch,'FaceAlpha',0.2);
    set(uPlot,'XData',[],'YData',[]);
    set(wuPlot,'XData',[],'YData',[]);

    wuMin=uicontrol('Style','edit',...
        'String',num2str(wu(1)),...
        'Units','normalized',...
        'Position',[0.05 0.04 0.07 0.03],...
        'Callback',{@wMinCallback,'U'},...
        'TooltipString','Minimum frequency in plot (rad/s)');

    wuMax=uicontrol('Style','edit',...
        'String',num2str(wu(end)),...
        'Units','normalized',...
        'Position',[0.58 0.04 0.07 0.03],...
        'Callback',{@wMaxCallback,'U'},...
        'TooltipString','Maximum frequency in plot (rad/s)');

	wuPoleHeadLine=uicontrol('Style','text',...
        'String','Poles (0)',...
        'FontUnits','normalized',...
        'FontSize',.9,...
        'BackgroundColor',[204/256 204/256 204/256],...
        'ForegroundColor',[1 0 0],...
        'Units','normalized',...
        'Position',[0.7 0.3 0.15 0.03]);

    wuPoleList=uicontrol('Style','listbox',...
		'Max',1,'Min',1,...
        'Units','normalized',...
        'Position',[0.7 0.13 0.15 0.17]);

	wuZeroHeadLine=uicontrol('Style','text',...
        'String','Zeros (0)',...
        'FontUnits','normalized',...
        'FontSize',.9,...
        'BackgroundColor',[204/256 204/256 204/256],...
        'ForegroundColor',[0 0 1],...
        'Units','normalized',...
        'Position',[0.85 0.3 0.15 0.03]);

    wuZeroList=uicontrol('Style','listbox',...
		'Max',1,'Min',1,...
        'Units','normalized',...
        'Position',[0.85 0.13 0.15 0.17]);

    uicontrol('Style','pushbutton',...
        'String','Add real pole',...
        'Units','normalized',...
        'Position',[0.7 0.16 0.15 0.03],...
		'Callback',{@addDLG,3});

    uicontrol('Style','pushbutton',...
        'String','Add complex pole pair',...
        'Units','normalized',...
        'Position',[0.7 0.13 0.15 0.03],...
		'Callback',{@addDLG,11});

	uicontrol('Style','pushbutton',...
        'String','Remove pole/poles',...
        'Units','normalized',...
        'Position',[0.7 0.1 0.15 0.03],...
		'Callback',{@removeCallback,'U','p'});

    uicontrol('Style','pushbutton',...
        'String','Add real zero',...
        'Units','normalized',...
        'Position',[0.85 0.16 0.15 0.03],...
		'Callback',{@addDLG,7});

    uicontrol('Style','pushbutton',...
        'String','Add complex zero pair',...
        'Units','normalized',...
        'Position',[0.85 0.13 0.15 0.03],...
		'Callback',{@addDLG,15});

	uicontrol('Style','pushbutton',...
        'String','Remove zero/zeros',...
        'Units','normalized',...
        'Position',[0.85 0.1 0.15 0.03],...
		'Callback',{@removeCallback,'U','z'});

	uicontrol('Style','pushbutton',...
        'String','Edit Pole-Zero diagram',...
        'Units','normalized',...
        'Position',[0.7 0.07 0.3 0.03],...
        'Callback',{@editPZ,'U'});

		uicontrol('Style','text',...
        'String','Gain: ',...
        'FontUnits','normalized',...
        'FontSize',.9,...
        'BackgroundColor',[204/256 204/256 204/256],...
        'ForegroundColor',[0 0 0],...
        'Units','normalized',...
        'Position',[0.7 0.04 0.04 0.02]);

	uGainEdit=uicontrol('Style','edit',...
        'String',num2str(get(Wu,'k')),...
        'Units','normalized',...
        'Position',[0.74 0.04 0.1 0.02],...
        'Callback',{@gainCallback,'U'});

%--------------------------------------------------------------------------


updateGUI();
computeController();
updateFreqSpan('A',1,1000);

%----------------------------------Functions-------------------------------


%---------------------------GUI-functions-----------------------------


    function updateGUI()
        updateSystemPlot('A');
        updateWeightPlot('A');
        updateYScale('A');
		updatePoleZeroList('S','p');
		updatePoleZeroList('S','z');
		updatePoleZeroList('T','p');
		updatePoleZeroList('T','z');
		updatePoleZeroList('U','p');
		updatePoleZeroList('U','z');
    end

	function removeCallback(src,eventdata,ax,pORz)
		switch ax
			case 'S'
				switch pORz
					case 'p'
						ind=get(wsPoleList,'Value');
						p=get(Ws,'p');
						p=p{1};
						removePole(ax,real(p(ind)),imag(p(ind)));
						set(wsPoleList,'Value',1);
					case 'z'
						ind=get(wsZeroList,'Value');
						z=get(Ws,'z');
						z=z{1};
						removeZero(ax,real(z(ind)),imag(z(ind)));
						set(wsZeroList,'Value',1);
				end
			case 'T'
				switch pORz
					case 'p'
						ind=get(wtPoleList,'Value');
						p=get(Wt,'p');
						p=p{1};
						removePole(ax,real(p(ind)),imag(p(ind)));
						set(wtPoleList,'Value',1);
					case 'z'
						ind=get(wtZeroList,'Value');
						z=get(Wt,'z');
						z=z{1};
						removeZero(ax,real(z(ind)),imag(z(ind)));
						set(wtZeroList,'Value',1);
				end
			case 'U'
				switch pORz
					case 'p'
						ind=get(wuPoleList,'Value');
						p=get(Wu,'p');
						p=p{1};
						removePole(ax,real(p(ind)),imag(p(ind)));
						set(wuPoleList,'Value',1);
					case 'z'
						ind=get(wuZeroList,'Value');
						z=get(Wu,'z');
						z=z{1};
						removeZero(ax,real(z(ind)),imag(z(ind)));
						set(wuZeroList,'Value',1);
				end
		end
		updateCurrentPZDia();
		updateGUI();
	end

	function addDLG(src,eventdata,type)
		switch bitand(3,type)
			case 1 %S
				if bitand(4,type) == 0 % pole
					if bitand(8,type) == 0 % real
						answer = inputdlg('s=','Add real pole',1);
						if ~isempty(answer)
							answer=str2num(answer{1});
							for j=1:length(answer), addPole('S',real(answer(j))); end
						end
					else %complex
						answer = inputdlg({'s=','(+-) i'},'Add complex pole pair',1);
						if ~isempty(answer)
							answer1=str2num(answer{1});
							answer2=str2num(answer{2});
							for j=1:min([length(answer1) length(answer2)]), addPole('S',real(answer1(j)),real(answer2(j))); end
						end
					end
				else %zero
					if bitand(8,type) == 0 % real
						answer = inputdlg('s=','Add real zero',1);
						if ~isempty(answer)
							answer=str2num(answer{1});
							for j=1:length(answer), addZero('S',real(answer(j))); end
						end
					else %complex
						answer = inputdlg({'s=','(+-) i'},'Add complex zero pair',1);
						if ~isempty(answer)
							answer1=str2num(answer{1});
							answer2=str2num(answer{2});
							for j=1:min([length(answer1) length(answer2)]), addZero('S',real(answer1(j)),real(answer2(j))); end
						end
					end
				end
			case 2 %T
				if bitand(4,type) == 0 % pole
					if bitand(8,type) == 0 % real
						answer = inputdlg('s=','Add real pole',1);
						if ~isempty(answer)
							answer=str2num(answer{1});
							for j=1:length(answer), addPole('T',real(answer(j))); end
						end
					else %complex
						answer = inputdlg({'s=','(+-) i'},'Add complex pole pair',1);
						if ~isempty(answer)
							answer1=str2num(answer{1});
							answer2=str2num(answer{2});
							for j=1:min([length(answer1) length(answer2)]), addPole('T',real(answer1(j)),real(answer2(j))); end
						end
					end
				else %zero
					if bitand(8,type) == 0 % real
						answer = inputdlg('s=','Add real zero',1);
						if ~isempty(answer)
							answer=str2num(answer{1});
							for j=1:length(answer), addZero('T',real(answer(j))); end
						end
					else %complex
						answer = inputdlg({'s=','(+-) i'},'Add complex zero pair',1);
						if ~isempty(answer)
							answer1=str2num(answer{1});
							answer2=str2num(answer{2});
							for j=1:min([length(answer1) length(answer2)]), addZero('T',real(answer1(j)),real(answer2(j))); end
						end
					end
				end
			case 3 %U
				if bitand(4,type) == 0 % pole
					if bitand(8,type) == 0 % real
						answer = inputdlg('s=','Add real pole',1);
						if ~isempty(answer)
							answer=str2num(answer{1});
							for j=1:length(answer), addPole('U',real(answer(j))); end
						end
					else %complex
						answer = inputdlg({'s=','(+-) i'},'Add complex pole pair',1);
						if ~isempty(answer)
							answer1=str2num(answer{1});
							answer2=str2num(answer{2});
							for j=1:min([length(answer1) length(answer2)]), addPole('U',real(answer1(j)),real(answer2(j))); end
						end
					end
				else %zero
					if bitand(8,type) == 0 % real
						answer = inputdlg('s=','Add real zero',1);
						if ~isempty(answer)
							answer=str2num(answer{1});
							for j=1:length(answer), addZero('U',real(answer(j))); end
						end
					else %complex
						answer = inputdlg({'s=','(+-) i'},'Add complex zero pair',1);
						if ~isempty(answer)
							answer1=str2num(answer{1});
							answer2=str2num(answer{2});
							for j=1:min([length(answer1) length(answer2)]), addZero('U',real(answer1(j)),real(answer2(j))); end
						end
					end
				end
		end
		updateCurrentPZDia();
	end

	function autoSetFrequency(src,eventdata)
		[mag,phase,w1]=bode(S);
		[mag,phase,w2]=bode(inv(Ws));
		[mag,phase,w3]=bode(T);
		[mag,phase,w4]=bode(inv(Wt));
		[mag,phase,w5]=bode(U);
		[mag,phase,w6]=bode(inv(Wu));
		w=[ w1(:) ; w2(:) ; w3(:) ; w4(:) ; w5(:) ; w6(:) ];
		updateFreqSpan('A',min(w),max(w));
	end

    function updateFreqSpan(ax,wMin,wMax)
        if wMin<=0
            warndlg('The frequency must be greater than zero','Not a valid input');
            return;
        elseif wMax<=wMin
            warndlg('The maximum frequency must be greater than the minimum','Not a valid input');
            return;
        else
            switch ax
                case 'S'
                    ws=logspace(log10(wMin),log10(wMax),100)';
                    set(wsBode,'XLim',[wMin wMax]);
                    updateWeightPlot('S');
                    updateSystemPlot('S');
                    updateYScale('S');
                    set(wsMin,'String',num2str(wMin));
                    set(wsMax,'String',num2str(wMax));
                case 'T'
                    wt=logspace(log10(wMin),log10(wMax),100)';
                    set(wtBode,'XLim',[wMin wMax]);
                    updateWeightPlot('T');
                    updateSystemPlot('T');
                    updateYScale('T');
                    set(wtMin,'String',num2str(wMin));
                    set(wtMax,'String',num2str(wMax));
                case 'U'
                    wu=logspace(log10(wMin),log10(wMax),100)';
                    set(wuBode,'XLim',[wMin wMax]);
                    updateWeightPlot('U');
                    updateSystemPlot('U');
                    updateYScale('U');
                    set(wuMin,'String',num2str(wMin));
                    set(wuMax,'String',num2str(wMax));
                case 'A'
                    updateFreqSpan('S',wMin,wMax);
                    updateFreqSpan('T',wMin,wMax);
                    updateFreqSpan('U',wMin,wMax);
            end
        end
        updateYScale('A');
    end

    function updateYScale(ax)
        switch ax
            case 'S'
                y=[get(sPlot,'YData') get(wsPlot,'YData')];
                c=(log10(max(y))-log10(min(y)))/20;
                if(c<=0), c=1; end;
                set(wsBode,'YLim',[min(y)/10^c max(y)*10^c]);
                yy=get(wsPatch,'YData');
                set(wsPatch,'YData',[yy(1:end-2); max(y)*10^c; max(y)*10^c]);
            case 'T'
                y=[get(tPlot,'YData') get(wtPlot,'YData')];
                c=(log10(max(y))-log10(min(y)))/20;
                if(c<=0), c=1; end;
                set(wtBode,'YLim',[min(y)/10^c max(y)*10^c]);
                yy=get(wtPatch,'YData');
                set(wtPatch,'YData',[yy(1:end-2); max(y)*10^c; max(y)*10^c]);
            case 'U'
                y=[get(uPlot,'YData') get(wuPlot,'YData')];
                c=(log10(max(y))-log10(min(y)))/20;
                if(c<=0), c=1; end;
                set(wuBode,'YLim',[min(y)/10^c max(y)*10^c]);
                yy=get(wuPatch,'YData');
                set(wuPatch,'YData',[yy(1:end-2); max(y)*10^c; max(y)*10^c]);
            case 'A'
                updateYScale('S');
                updateYScale('T');
                updateYScale('U');
        end
    end

    function updateWeightPlot(ax)
       switch ax
           case 'S'
               mag=abs(freqresp(inv(Ws),ws));
               mag=mag(:);
               set(wsPlot,'XData',ws,'YData',mag);
               y=get(wsPatch,'YData');
               set(wsPatch,'XData',[ws; ws(end); ws(1)],'YData',[mag; y(end); y(end)]);
           case 'T'
               mag=abs(freqresp(inv(Wt),wt));
               mag=mag(:);
               set(wtPlot,'XData',wt,'YData',mag);
               y=get(wtPatch,'YData');
               set(wtPatch,'XData',[wt; wt(end); wt(1)],'YData',[mag; y(end); y(end)]);
           case 'U'
               mag=abs(freqresp(inv(Wu),wu));
               mag=mag(:);
               set(wuPlot,'XData',wu,'YData',mag);
               y=get(wuPatch,'YData');
               set(wuPatch,'XData',[wu; wu(end); wu(1)],'YData',[mag; y(end); y(end)]);
           case 'A'
               updateWeightPlot('S');
               updateWeightPlot('T');
               updateWeightPlot('U');
       end
    end

    function updateSystemPlot(ax)
		switch ax
			case 'S'
				[mag,phase,ws] = bode(S,{min(ws), max(ws)});
				mag=mag(:);
				set(sPlot,'XData',ws,'YData',mag);
			case 'T'
				[mag,phase,wt] = bode(T,{min(wt), max(wt)});
				mag=mag(:);
				set(tPlot,'XData',wt,'YData',mag);
			case 'U'
				[mag,phase,wu] = bode(U,{min(wu), max(wu)});
				mag=mag(:);
				set(uPlot,'XData',wu,'YData',mag);
			case 'A'
				updateSystemPlot('S');
				updateSystemPlot('T');
				updateSystemPlot('U');
		end
	end

	function wMinCallback(src,eventdata,ax)
		switch ax
			case 'S'
				wMin=str2double(get(wsMin,'String'));
				wMax=max(ws);
				updateFreqSpan('S',wMin,wMax);
			case 'T'
				wMin=str2double(get(wtMin,'String'));
				wMax=max(wt);
				updateFreqSpan('T',wMin,wMax);
			case 'U'
				wMin=str2double(get(wuMin,'String'));
				wMax=max(wu);
				updateFreqSpan('U',wMin,wMax);
			case 'A'
				wMinCallback(0,0,'S');
				wMinCallback(0,0,'T');
				wMinCallback(0,0,'U');
		end
	end


    function wMaxCallback(src,eventdata,ax)
        switch ax
            case 'S'
                wMin=min(ws);
                wMax=str2double(get(wsMax,'String'));
                updateFreqSpan('S',wMin,wMax);
            case 'T'
                wMin=min(wt);
                wMax=str2double(get(wtMax,'String'));
                updateFreqSpan('T',wMin,wMax);
            case 'U'
                wMin=min(wu);
                wMax=str2double(get(wuMax,'String'));
                updateFreqSpan('U',wMin,wMax);
            case 'A'
                wMaxCallback(0,0,'S');
                wMaxCallback(0,0,'T');
                wMaxCallback(0,0,'U');
        end
	end

    function updatePoleZeroList(ax,pORz)
        if ~strcmp(pORz,'p') && ~strcmp(pORz,'z')
            return;
        end
        switch ax
            case 'S'
                pz=get(Ws,pORz);
            case 'T'
                pz=get(Wt,pORz);
            case 'U'
                pz=get(Wu,pORz);
            otherwise
                return;
        end
        pz=pz{1};
        poleZeroStringCell=[];
        for j=1:length(pz)
            poleZeroStringCell{j}=num2str(pz(j));
        end
        switch ax
            case 'S'
                if strcmp(pORz,'p')
                    set(wsPoleList,'String',poleZeroStringCell);
                    set(wsPoleHeadLine,'String',['Poles (' num2str(length(pz)) ')']);
                    return;
                end
                set(wsZeroList,'String',poleZeroStringCell);
                set(wsZeroHeadLine,'String',['Zeros (' num2str(length(pz)) ')']);
            case 'T'
                if strcmp(pORz,'p')
                    set(wtPoleList,'String',poleZeroStringCell);
                    set(wtPoleHeadLine,'String',['Poles (' num2str(length(pz)) ')']);
                    return;
                end
                set(wtZeroList,'String',poleZeroStringCell);
                set(wtZeroHeadLine,'String',['Zeros (' num2str(length(pz)) ')']);
            case 'U'
                if strcmp(pORz,'p')
                    set(wuPoleList,'String',poleZeroStringCell);
                    set(wuPoleHeadLine,'String',['Poles (' num2str(length(pz)) ')']);
                    return;
                end
                set(wuZeroList,'String',poleZeroStringCell);
                set(wuZeroHeadLine,'String',['Zeros (' num2str(length(pz)) ')']);
        end
    end

    function editPZ(src,eventdata,we)
		if ~strcmp(currentEditorWeight,'none')
			output('close');
		end
        currentEditorWeight = we;
        WeightEditor(we,@input);
    end

%---------------------------PZdiagram-----------------------------

    persistent output;
	output=@dummy;
	currentEditorWeight = 'none';
    function input(action,varargin)
        switch lower(action)
			case 'setinput'
				output=varargin{1};
			case 'updatepzdata'
				switch currentEditorWeight
					case 'S'
						p=get(Ws,'p');
						z=get(Ws,'z');
					case 'T'
						p=get(Wt,'p');
						z=get(Wt,'z');
					case 'U'
						p=get(Wu,'p');
						z=get(Wu,'z');
					otherwise
						return;
				end
				output('updatePZData',p,z);
			case 'addrealpole'
				addPole(currentEditorWeight,varargin{1});
				input('updatePZData');
			case 'addrealzero'
				addZero(currentEditorWeight,varargin{1});
				input('updatePZData');
			case 'addcomplexpole'
				addPole(currentEditorWeight,varargin{1},varargin{2});
				input('updatePZData');
			case 'addcomplexzero'
				addZero(currentEditorWeight,varargin{1},varargin{2});
				input('updatePZData');
			case 'removepole'
				removePole(currentEditorWeight,varargin{1},varargin{2});
				input('updatePZData');
			case 'removezero'
				removeZero(currentEditorWeight,varargin{1},varargin{2});
				input('updatePZData');
			case 'movepole'
				movePole(currentEditorWeight,varargin{1},varargin{2},varargin{3});
				input('updatePZData');
			case 'movezero'
				moveZero(currentEditorWeight,varargin{1},varargin{2},varargin{3});
				input('updatePZData');
			case 'updatecontroller'
				computeController();
				updateSystemPlot('A');
				updateYScale('A');
			case 'updateyscale'
				updateYScale('A');
			case 'close'
				currentEditorWeight = 'none';
				output=@dummy;
		end
    end

	function dummy(varargin)
	end

	function updateCurrentPZDia()
		switch currentEditorWeight
			case 'S'
				output('updatePZData',get(Ws,'p'),get(Ws,'z'));
			case 'T'
				output('updatePZData',get(Wt,'p'),get(Wt,'z'));
			case 'U'
				output('updatePZData',get(Wu,'p'),get(Wu,'z'));
		end
	end

%-------------------------------------------------------------------

%---------------------------Logic-functions-----------------------------

    function addPole(ax,re,im)
		if re>0
            warnString=['A pole in the right half plane will yeild a ustable weight, which is not allowed'];
            warndlg(warnString,'Unable to add pole/poles');
            return;
		end
        switch ax
            case 'S'
               p=get(Ws,'p');
            case 'T'
               p=get(Wt,'p');
            case 'U'
               p=get(Wu,'p');
            otherwise
                return;
        end
        p=p{1};
        if nargin==2
            p=[p; re];
        elseif nargin==3
            p=[p; re+abs(im)*i; re-abs(im)*i];
        end
        switch ax
            case 'S'
				z=get(Ws,'z'); z=z{1};
				k=get(Ws,'k');
				Ws=zpk(z,p,k);
            case 'T'
               	Wt=zpk(get(Wt,'z'),p,get(Wt,'k'));
            case 'U'
               	Wu=zpk(get(Wu,'z'),p,get(Wu,'k'));
        end
		updateWeightPlot(ax);
		updateYScale(ax);
		updatePoleZeroList(ax,'p');
    end

    function addZero(ax,re,im)
        switch ax
            case 'S'
                p=get(Ws,'p');
                z=get(Ws,'z');
            case 'T'
                p=get(Wt,'p');
                z=get(Wt,'z');
            case 'U'
                p=get(Wu,'p');
                z=get(Wu,'z');
            otherwise
                return;
        end
        p=p{1};
        z=z{1};
        if length(p)<=length(z)+nargin-2
            warnString=['Adding ' num2str(nargin-1) ' zero/zeros would lead to a non proper weight and is therefore forbidden. Try to add a pole first'];
            warndlg(warnString,'Unable to add zero/zeros');
            return;
        else
            if nargin==2
                z=[z; re];
            elseif nargin==3
                z=[z; re+abs(im)*i; re-abs(im)*i];
            end
        end
        switch ax
            case 'S'
                Ws=zpk(z,p,get(Ws,'k'));
            case 'T'
                Wt=zpk(z,p,get(Wt,'k'));
            case 'U'
                Wu=zpk(z,p,get(Wu,'k'));
        end
		updateWeightPlot(ax);
		updateYScale(ax);
		updatePoleZeroList(ax,'z');
    end

    function removePole(ax,re,im)
        switch ax
            case 'S'
                p=get(Ws,'p');
                z=get(Ws,'z');
            case 'T'
                p=get(Wt,'p');
                z=get(Wt,'z');
            case 'U'
                p=get(Wu,'p');
                z=get(Wu,'z');
            otherwise
                return;
        end
        p=p{1};
        z=z{1};
        if nargin==2
            if length(z)>length(p)-1
                warnString='Removing one pole would lead to a non proper weight and is therefore forbidden. Try to remove a zero first';
                warndlg(warnString,'Unable to remove pole');
                return;
            else
                ind=find(p==re);
                if ~isempty(ind), p(ind(1))=[]; end
            end
        elseif nargin==3
            polesToRemove=sign(sum(find(p==re+abs(im)*i)))+sign(sum(find(p==re-abs(im)*i)))-1+sign(abs(im));
            if length(z)>length(p)-polesToRemove
                warnString=['Removing ' num2str(polesToRemove) ' pole/poles would lead to a non proper weight and is therefore forbidden. Try to remove a zero first'];
                warndlg(warnString,'Unable to remove pole/poles');
                return;
            else
                ind=find(p==re+abs(im)*i);
                if ~isempty(ind), p(ind(1))=[]; end
                ind=find(p==re-abs(im)*i);
                if ~isempty(ind), p(ind(1))=[]; end
            end
        end
        switch ax
            case 'S'
                Ws=zpk(get(Ws,'z'),p,get(Ws,'k'));
            case 'T'
                Wt=zpk(get(Wt,'z'),p,get(Wt,'k'));
            case 'U'
                Wu=zpk(get(Wu,'z'),p,get(Wu,'k'));
        end
		updateWeightPlot(ax);
		updateYScale(ax);
		updatePoleZeroList(ax,'p');
    end

    function removeZero(ax,re,im)
        switch ax
            case 'S'
                z=get(Ws,'z');
            case 'T'
                z=get(Wt,'z');
            case 'U'
                z=get(Wu,'z');
            otherwise
                return;
        end
        z=z{1};
        if nargin==2
            ind=find(z==re);
            if ~isempty(ind), z(ind(1))=[]; end
        elseif nargin==3
            ind=find(z==re+abs(im)*i);
            if ~isempty(ind), z(ind(1))=[]; end
            ind=find(z==re-abs(im)*i);
            if ~isempty(ind), z(ind(1))=[]; end
        end
        switch ax
            case 'S'
                Ws=zpk(z,get(Ws,'p'),get(Ws,'k'));
            case 'T'
                Wt=zpk(z,get(Wt,'p'),get(Wt,'k'));
            case 'U'
                Wu=zpk(z,get(Wu,'p'),get(Wu,'k'));
        end
		updateWeightPlot(ax);
		updateYScale(ax);
		updatePoleZeroList(ax,'z');
    end

    function movePole(ax,ind,re,im)
		if re>=0
			output('illegalPoleMove');
			return;
		end
        switch ax
            case 'S'
                p=get(Ws,'p');
            case 'T'
                p=get(Wt,'p');
            case 'U'
                p=get(Wu,'p');
            otherwise
                return;
        end
        p=p{1};
        oldIm=imag(p(ind));
        oldRe=real(p(ind));
        if oldIm~=0
            con=find(p==oldRe-oldIm*i);
            if length(con)~=0
                p(ind)=re+im*i;
                p(con(1))=re-im*i;
            end
        else
            con=find(p==oldRe);
            if length(con)==1
                p(ind)=re;
            elseif length(con)>1
                con=find(con~=ind);
                p(ind)=re+im*i;
                p(con(1))=re-im*i;
            end
        end
        switch ax
            case 'S'
                Ws=zpk(get(Ws,'z'),p,get(Ws,'k'));
            case 'T'
                Wt=zpk(get(Wt,'z'),p,get(Wt,'k'));
            case 'U'
                Wu=zpk(get(Wu,'z'),p,get(Wu,'k'));
            otherwise
                return;
        end
		updateWeightPlot(ax);
		%updateYScale(ax);
		updatePoleZeroList(ax,'p');
    end

    function moveZero(ax,ind,re,im)
        switch ax
            case 'S'
                z=get(Ws,'z');
            case 'T'
                z=get(Wt,'z');
            case 'U'
                z=get(Wu,'z');
            otherwise
                return;
        end
        z=z{1};
        oldIm=imag(z(ind));
        oldRe=real(z(ind));
        if oldIm~=0
            con=find(z==oldRe-oldIm*i);
            if length(con)~=0
                z(ind)=re+im*i;
                z(con(1))=re-im*i;
            end
        else
            con=find(z==oldRe);
            if length(con)==1
                z(ind)=re;
            elseif length(con)>1
                con=find(con~=ind);
                z(ind)=re+im*i;
                z(con(1))=re-im*i;
            end
        end
        switch ax
            case 'S'
                Ws=zpk(z,get(Ws,'p'),get(Ws,'k'));
            case 'T'
                Wt=zpk(z,get(Wt,'p'),get(Wt,'k'));
            case 'U'
                Wu=zpk(z,get(Wu,'p'),get(Wu,'k'));
            otherwise
                return;
        end
		updateWeightPlot(ax);
		%updateYScale(ax);
		updatePoleZeroList(ax,'z');
    end

	function enableWeight(src,eventdata,we)
		switch we
			case 'T'
				if enable.T==1;
					enable.T=0;
					set(enableTButton,'String','Enable')
					set(wtPatch,'FaceColor',[0.97 0.97 1]);
					set(wtPlot,'Color',[0.5 0.5 0.5]);
				else
					enable.T=1;
					set(enableTButton,'String','Disable')
					set(wtPatch,'FaceColor',[0.9 0.9 1]);
					set(wtPlot,'Color',[0 0 0]);
				end
			case 'U'
				if enable.U==1;
					enable.U=0;
					set(enableUButton,'String','Enable')
					set(wuPatch,'FaceColor',[0.97 0.97 1]);
					set(wuPlot,'Color',[0.5 0.5 0.5]);
				else
					enable.U=1;
					set(enableUButton,'String','Disable')
					set(wuPatch,'FaceColor',[0.9 0.9 1]);
					set(wuPlot,'Color',[0 0 0]);
				end
		end

		%computeController();
	end

	function gainCallback(src,eventdata,ax)
		switch ax
			case 'S'
				newK=real(str2num(get(sGainEdit,'String')));
				if ~isempty(newK)
					newK=newK(1);
					if newK == 0, newK=get(Ws,'k'); end
					Ws=zpk(get(Ws,'z'),get(Ws,'p'),newK);
				end
				set(sGainEdit,'String',num2str(get(Ws,'k')));
			case 'T'
				newK=real(str2num(get(tGainEdit,'String')));
				if ~isempty(newK)
					newK=newK(1);
					if newK == 0, newK=get(Wt,'k'); end
					Wt=zpk(get(Wt,'z'),get(Wt,'p'),newK);
				end
				set(tGainEdit,'String',num2str(get(Wt,'k')));
			case 'U'
				newK=real(str2num(get(uGainEdit,'String')));
				if ~isempty(newK)
					newK=newK(1);
					if newK == 0, newK=get(Wu,'k'); end
					Wu=zpk(get(Wu,'z'),get(Wu,'p'),newK);
				end
				set(uGainEdit,'String',num2str(get(Wu,'k')));
		end
		updateGUI();
	end

    function computeController(src,eventdata)
		try
			[F,CL,GAM,INFO]=mixsyn(G,tf(Ws),tf(enable.T*Wt),tf(enable.U*Wu));
            disp('Controller computed successfully');
            disp(['gamma= ' num2str(GAM)]);
            tmp=zpk(F); tmp=get(tmp,'p'); tmp=length(tmp{1});
            disp(['order: ' num2str(tmp)]);
			assignin('base','CL',CL);
			S=inv(1+G*F);
			T=G*F*inv(1+G*F);
			U=F*inv(1+G*F);
			updateGUI();
		catch
			warnString=['Some error occurred, please control the weights'];
			warndlg(warnString,'Controller not updated!');
		end
    end

    function exportController(src,eventdata)
        assignin('base','F',F);
    end


%-------------------------------------------------------------------

end




