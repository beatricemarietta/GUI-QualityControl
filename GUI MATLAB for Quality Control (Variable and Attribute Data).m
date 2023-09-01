function varargout = control_chart(varargin)
% CONTROL_CHART MATLAB code for control_chart.fig
%      CONTROL_CHART, by itself, creates a new CONTROL_CHART or raises the existing
%      singleton*.
%
%      H = CONTROL_CHART returns the handle to a new CONTROL_CHART or the handle to
%      the existing singleton*.
%
%      CONTROL_CHART('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTROL_CHART.M with the given input arguments.
%
%      CONTROL_CHART('Property','Value',...) creates a new CONTROL_CHART or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before control_chart_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to control_chart_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help control_chart

% Last Modified by GUIDE v2.5 08-Oct-2021 00:32:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @control_chart_OpeningFcn, ...
                   'gui_OutputFcn',  @control_chart_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before control_chart is made visible.
function control_chart_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to control_chart (see VARARGIN)

% Choose default command line output for control_chart
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes control_chart wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = control_chart_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_exit.
function pushbutton_exit_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


function edit_o2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_o2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_o2 as text
%        str2double(get(hObject,'String')) returns contents of edit_o2 as a double


% --- Executes during object creation, after setting all properties.
function edit_o2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_o2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_o1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_o1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_o1 as text
%        str2double(get(hObject,'String')) returns contents of edit_o1 as a double


% --- Executes during object creation, after setting all properties.
function edit_o1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_o1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_a.
function popupmenu_a_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.popupmenu_a,'Value');
if a==2
    set(handles.uitable_p,'Visible','on');
    set(handles.uitable_np,'Visible','off');
    set(handles.uitable_c,'Visible','off');
    set(handles.uitable_u,'Visible','off');
    set(handles.edit_id,'Enable','on');
    set(handles.edit_o1,'String','P Chart');
elseif a==3
    set(handles.uitable_p,'Visible','off');
    set(handles.uitable_np,'Visible','on');
    set(handles.uitable_c,'Visible','off');
    set(handles.uitable_u,'Visible','off');
    set(handles.edit_id,'Enable','on');
    set(handles.edit_o1,'String','NP Chart');
elseif a==4
    set(handles.uitable_p,'Visible','off');
    set(handles.uitable_np,'Visible','off');
    set(handles.uitable_c,'Visible','on');
    set(handles.uitable_u,'Visible','off');
    set(handles.edit_id,'Enable','on');
    set(handles.edit_o1,'String','C Chart');
elseif a==5
    set(handles.uitable_p,'Visible','off');
    set(handles.uitable_np,'Visible','off');
    set(handles.uitable_c,'Visible','off');
    set(handles.uitable_u,'Visible','on');
    set(handles.edit_id,'Enable','on');
    set(handles.edit_o1,'String','U Chart');
elseif a==1
    set(handles.edit_id,'Enable','off');
    set(handles.edit_o1,'String','');
end
guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_a contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_a


% --- Executes during object creation, after setting all properties.
function popupmenu_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_v.
function popupmenu_v_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v=get(handles.popupmenu_v,'Value');
if v==2
    set(handles.uipanel_xbarr,'Visible','on');
    set(handles.uipanel_xbars,'Visible','off');
    set(handles.uitable_r,'Visible','on');
    set(handles.uitable_s,'Visible','off');

    set(handles.edit_id,'Enable','on');
    set(handles.edit_o1,'String','R Chart');
    set(handles.edit_o2,'String','X-Bar Chart');
elseif v==3
    set(handles.uipanel_xbars,'Visible','on');
    set(handles.uipanel_xbarr,'Visible','off');
    set(handles.uitable_r,'Visible','off');
    set(handles.uitable_s,'Visible','on');
    set(handles.edit_id,'Enable','on');
    set(handles.edit_o1,'String','S Chart');
    set(handles.edit_o2,'String','X-Bar Chart');
elseif v==1
    set(handles.edit_id,'Enable','off');
    set(handles.edit_o1,'String','');
    set(handles.edit_o2,'String','');
end
guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_v contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_v


% --- Executes during object creation, after setting all properties.
function popupmenu_v_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_id.
function pushbutton_id_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=xlsread(get(handles.edit_id,'string'));
handles.data=data;
if (get(handles.radiobutton_v,'Value')==1)
    set(handles.uitable_v,'Data',data);
else (get(handles.radiobutton_a,'Value')==1)
    set(handles.uitable_a,'Data',data);
end
guidata(hObject,handles);


function edit_id_Callback(hObject, eventdata, handles)
% hObject    handle to edit_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_id as text
%        str2double(get(hObject,'String')) returns contents of edit_id as a double


% --- Executes during object creation, after setting all properties.
function edit_id_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_ok.
function pushbutton_ok_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v=get(handles.popupmenu_v,'Value');
a=get(handles.popupmenu_a,'Value');
if (get(handles.radiobutton_v,'Value')==1)
    if v==2
        A2=str2num(get(handles.edit_a2,'string'));
        D3=str2num(get(handles.edit_d3,'string'));
        D4=str2num(get(handles.edit_d4,'string'));
        data=handles.data;
        a=size(data);
        b=a(:,1);
        c=a(:,2);
        o=data(:,2:c);
        o=o';
        xi=sum(o);
        xi=xi';
        xi_bar=mean(o);
        xi_bar=xi_bar';
        xibarbar=sum(xi_bar)/b;

        Ri=max(o)-min(o);
        Ri=Ri';
        R_bar=sum(Ri)/b;
        
        CL_xbar=ones(b,1).*xibarbar;
        UCL_xbar=ones(b,1).*(xibarbar+A2*R_bar);
        LCL_xbar=ones(b,1).*(xibarbar-A2*R_bar);
    
        CL_R=ones(b,1).*R_bar;
        UCL_R=ones(b,1).*(D4*R_bar);
        LCL_R=ones(b,1).*(D3*R_bar);

        output_R=[Ri UCL_R CL_R LCL_R];
        output_xbar=[xi_bar UCL_xbar CL_xbar LCL_xbar];
    
        axes(handles.axes2)
        plot(output_xbar)
        title('X-Bar Chart');
        grid on;
        axes(handles.axes3)
        plot(output_R)
        title('R Chart');
        grid on;
        
        set(handles.uitable_r,'Data',output_R);
        set(handles.uitable_xbar,'Data',output_xbar);
        
    elseif v==3
        A3=str2num(get(handles.edit_a3,'string'));
        B3=str2num(get(handles.edit_b3,'string'));
        B4=str2num(get(handles.edit_b4,'string'));
        data=handles.data;
        a=size(data);
        b=a(:,1);
        c=a(:,2);
        o=data(:,2:c);
        o=o';
        xi=sum(o);
        xi=xi';
        xi_bar=mean(o);
        xi_bar=xi_bar';
        xibarbar=sum(xi)/((c-1)*b);

        for j=1:b
            s(j,:)=o(:,j)-xi_bar(j,1);
        end

        s2=s.^2;
        s2=s2';
        sums2=sum(s2);
        sums2=sums2';

        si2=sums2./(c-1-1);
        si=sqrt(si2);

        sbar=sqrt((sum((c-1-1)*si.^2))/((c-1-1)*b));

        CL_xbar=ones(b,1).*xibarbar;
        UCL_xbar=ones(b,1).*(xibarbar+A3*sbar);
        LCL_xbar=ones(b,1).*(xibarbar-A3*sbar);

        CL_S=ones(b,1).*sbar;
        UCL_S=ones(b,1).*(B4*sbar);
        LCL_S=ones(b,1).*(B3*sbar);

        output_S=[si UCL_S CL_S LCL_S];
        output_xbar=[xi_bar UCL_xbar CL_xbar LCL_xbar];

        axes(handles.axes2)
        plot(output_xbar)
        title('X-Bar Chart');
        grid on;
        axes(handles.axes3)
        plot(output_S)
        title('S Chart');
        grid on;

        set(handles.uitable_s,'Data',output_S);
        set(handles.uitable_xbar,'Data',output_xbar);

    end
    
else (get(handles.radiobutton_a,'Value')==1)
    if a==2
        data=handles.data;
        x=length(data);
        ni=data(:,2);
        Di=data(:,3);
        Pi=Di./ni;
        pbar=sum(data(:,3))./sum(data(:,2));
        
        CL_p=ones(x,1).*pbar;
        UCL_p=ones(x,1)*(pbar)+(3*sqrt(pbar*(1-pbar))*sqrt(ni).^(-1));
        LCL_p=ones(x,1)*(pbar)-(3*sqrt(pbar*(1-pbar))*sqrt(ni).^(-1));
        LCL_p(find(LCL_p<0))=0;
        
        output_p=[Pi UCL_p CL_p LCL_p];
        axes(handles.axes1)
        plot(output_p)
        title('P Chart');
        grid on;
        set(handles.uitable_p,'Data',output_p);
        
    elseif a==3
        data=handles.data;
        x=length(data);
        ni=data(:,2);
        Di=data(:,3);
        Pi=Di./ni;
        pbar=sum(data(:,3))./sum(data(:,2));
        npbar=sum(Di)/x;

        CL_npbar=ones(x,1).*npbar;
        UCL_npbar=ones(x,1)*(npbar+3*sqrt(npbar*(1-pbar)));
        LCL_npbar=ones(x,1)*(npbar-3*sqrt(npbar*(1-pbar)));
        LCL_npbar(find(LCL_npbar<0))=0;

        output_np=[Di UCL_npbar CL_npbar LCL_npbar];
        axes(handles.axes1)
        plot(output_np)
        title('NP Chart');
        grid on;
        set(handles.uitable_np,'Data',output_np);
        
    elseif a==4
        data=handles.data;
        x=length(data);
        Ci=data(:,3);
        cbar=sum(Ci)/x;

        CL_c=ones(x,1).*cbar;
        UCL_c=ones(x,1)*(cbar)+(3*sqrt(cbar));
        LCL_c=ones(x,1)*(cbar)-(3*sqrt(cbar));
        LCL_c(find(LCL_c<0))=0;

        output_c=[Ci UCL_c CL_c LCL_c];
        axes(handles.axes1)
        plot(output_c)
        title('C Chart');
        grid on;
        set(handles.uitable_c,'Data',output_c);
                
    elseif a==5
        data=handles.data;
        x=length(data);
        ni=data(:,2);
        Xi=data(:,3);
        Ui=Xi./ni;
        ubar=sum(Xi)/sum(ni);
        
        CL_u=ones(x,1).*ubar;
        UCL_u=ones(x,1)*(ubar)+(3*sqrt(ubar)*sqrt(ni).^(-1));
        LCL_u=ones(x,1)*(ubar)-(3*sqrt(ubar)*sqrt(ni).^(-1));
        LCL_u(find(LCL_u<0))=0;

        output_u=[Ui UCL_u CL_u LCL_u];
        axes(handles.axes1)
        plot(output_u)
        title('U Chart');
        grid on;
        set(handles.uitable_u,'Data',output_u);
        
    end
end

% --- Executes on button press in pushbutton_res.
function pushbutton_res_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit_id,'String','');
set(handles.edit_o1,'String','');
v=get(handles.popupmenu_v,'Value');
a=get(handles.popupmenu_a,'Value');
if (get(handles.radiobutton_v,'Value')==1)
    cla(handles.axes2,'reset');
    cla(handles.axes3,'reset');
    set(handles.uitable_v,'Data',{});
    set(handles.edit_o2,'String','');
    set(handles.uitable_xbar,'Data',{});
    if v==2
        set(handles.edit_a2,'String','');
        set(handles.edit_d3,'String','');
        set(handles.edit_d4,'String','');
        set(handles.uitable_r,'Data',{});
    elseif v==3
        set(handles.edit_a3,'String','');
        set(handles.edit_b3,'String','');
        set(handles.edit_b4,'String','');
        set(handles.uitable_s,'Data',{});
    end
else (get(handles.radiobutton_a,'Value')==1)
    cla(handles.axes1,'reset');
    set(handles.uitable_a,'Data',{});
    if a==2
        set(handles.uitable_p,'Data',{});     
    elseif a==3
        set(handles.uitable_np,'Data',{});     
    elseif a==4
        set(handles.uitable_c,'Data',{});     
    elseif a==5
        set(handles.uitable_u,'Data',{});     
    end
end


function edit_d4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_d4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_d4 as text
%        str2double(get(hObject,'String')) returns contents of edit_d4 as a double


% --- Executes during object creation, after setting all properties.
function edit_d4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_d4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_d3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_d3 as text
%        str2double(get(hObject,'String')) returns contents of edit_d3 as a double


% --- Executes during object creation, after setting all properties.
function edit_d3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_a2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a2 as text
%        str2double(get(hObject,'String')) returns contents of edit_a2 as a double


% --- Executes during object creation, after setting all properties.
function edit_a2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_b4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_b4 as text
%        str2double(get(hObject,'String')) returns contents of edit_b4 as a double


% --- Executes during object creation, after setting all properties.
function edit_b4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_b3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_b3 as text
%        str2double(get(hObject,'String')) returns contents of edit_b3 as a double


% --- Executes during object creation, after setting all properties.
function edit_b3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_a3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a3 as text
%        str2double(get(hObject,'String')) returns contents of edit_a3 as a double


% --- Executes during object creation, after setting all properties.
function edit_a3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton_a.
function radiobutton_a_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable_v,'Visible','off');
set(handles.uitable_a,'Visible','on');
set(handles.popupmenu_v,'Enable','off');
set(handles.popupmenu_a,'Enable','on');
set(handles.uipanel_xbarr,'Visible','off');
set(handles.uipanel_xbars,'Visible','off');
set(handles.edit_id,'string','');
set(handles.uitable_v,'Data',{});
set(handles.uipanel_a,'Visible','on');
set(handles.uipanel_v,'Visible','off');
set(handles.uitable_xbar,'Visible','off');
set(handles.edit_o2,'Visible','off');
set(handles.uitable_r,'Visible','off');
set(handles.uitable_s,'Visible','off');
set(handles.uitable_p,'Visible','on');
set(handles.uitable_np,'Visible','on');
set(handles.uitable_c,'Visible','on');
set(handles.uitable_u,'Visible','on');
guidata(hObject,handles);

% Hint: get(hObject,'Value') returns toggle state of radiobutton_a


% --- Executes on button press in radiobutton_v.
function radiobutton_v_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable_v,'Visible','on');
set(handles.uitable_a,'Visible','off');
set(handles.popupmenu_v,'Enable','on');
set(handles.popupmenu_a,'Enable','off');
set(handles.uipanel_xbarr,'Visible','on');
set(handles.uipanel_xbars,'Visible','on');
set(handles.edit_id,'string','');
set(handles.uitable_a,'Data',{});
set(handles.uipanel_a,'Visible','off');
set(handles.uipanel_v,'Visible','on');
set(handles.uitable_xbar,'Visible','on');
set(handles.edit_o2,'Visible','on');
set(handles.uitable_r,'Visible','on');
set(handles.uitable_s,'Visible','on');
set(handles.uitable_p,'Visible','off');
set(handles.uitable_np,'Visible','off');
set(handles.uitable_c,'Visible','off');
set(handles.uitable_u,'Visible','off');
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of radiobutton_v
