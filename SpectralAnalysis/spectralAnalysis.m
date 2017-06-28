function varargout = spectralAnalysis(varargin)
% SPECTRALANALYSIS MATLAB code for spectralAnalysis.fig
%      SPECTRALANALYSIS, by itself, creates a new SPECTRALANALYSIS or raises the existing
%      singleton*.
%
%      H = SPECTRALANALYSIS returns the handle to a new SPECTRALANALYSIS or the handle to
%      the existing singleton*.
%
%      SPECTRALANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPECTRALANALYSIS.M with the given input arguments.
%
%      SPECTRALANALYSIS('Property','Value',...) creates a new SPECTRALANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before spectralAnalysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to spectralAnalysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help spectralAnalysis

% Last Modified by GUIDE v2.5 28-Jun-2017 20:29:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @spectralAnalysis_OpeningFcn, ...
                   'gui_OutputFcn',  @spectralAnalysis_OutputFcn, ...
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


% --- Executes just before spectralAnalysis is made visible.
function spectralAnalysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to spectralAnalysis (see VARARGIN)

% Choose default command line output for spectralAnalysis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes spectralAnalysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = spectralAnalysis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mytimer;
global Z1;
global Z2;
mytimer = timer('Period',3,'ExecutionMode','FixedRate');
mytimer.TimerFcn={@my_callback_fcn,handles};
start(mytimer);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mytimer
stop(mytimer)

% --- Executes on slider movement.


% --- Executes during object creation, after setting all properties.



% --- Executes on slider movement.


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.




% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


function my_callback_fcn(hObject,eventdata,handles)
global Z1
global Z2

Fs = 11024;
r = audiorecorder(Fs,8,1);
recordblocking(r,2);
N = Fs*2;
y = getaudiodata(r);
y = y(N/2+1:N);
N=11024;
x = linspace(0,N,N);
plot(handles.axes1,x,y,'b','LineWidth',1.5);
% ylim(handles.axes1,[-Z1,Z1]);
grid(handles.axes1);
disp("aa");

p = fft(y,N);
Pyy = 2*sqrt(p.*conj(p))/N;
% Pyy = 2*abs(p)/N;
f = linspace(0,Fs/2,N/2);
plot(handles.axes2,f,Pyy(1:N/2),'b','LineWidth',1.5);
ylim(handles.axes2,[0,0.1*Z2]);
grid(handles.axes2);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v1 = get(handles.slider5,'Value');
global Z1
Z1 = 0.1*2*v1;
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v2 = get(handles.slider6,'Value');
global Z2
Z2 = 0.1*2*v2;
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
