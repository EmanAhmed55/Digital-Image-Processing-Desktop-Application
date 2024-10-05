function varargout = sec(varargin)
% SEC MATLAB code for sec.fig
%      SEC, by itself, creates a new SEC or raises the existing
%      singleton*.
%
%      H = SEC returns the handle to a new SEC or the handle to
%      the existing singleton*.
%
%      SEC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEC.M with the given input arguments.
%
%      SEC('Property','Value',...) creates a new SEC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sec_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sec_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sec

% Last Modified by GUIDE v2.5 17-May-2022 06:00:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sec_OpeningFcn, ...
                   'gui_OutputFcn',  @sec_OutputFcn, ...
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


% --- Executes just before sec is made visible.
function sec_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sec (see VARARGIN)
% global x;
%  
% if x==8
%      handles.s1=thresholdapp; %load second gui
% else if x==7
%      handles.s1=greylevel;
%      
% else if x==2
%      handles.s1=resamplingupp;
%      
% else if x==3
%           handles.s1=Negative_img; 
%     else if x==5
%               handles.s1=Log;  
%         else if x==9
%                 handles.s1=firstapp;
%             else if x==11
%                     handles.s1=BitGraySlicing;
%                     
%             else if x==12
%                     handles.s1=add;
%                         
%             else if x==13
%                     handles.s1=subtract_num_from_imgfig;       
%           else if x==14
%                     handles.s1=untitled1; 
%                     
%           else if x==19
%                     handles.s1=Histogram; 
%                     
%            else if x==20
%                     handles.s1=hisogram_E;                 
%                 
%          else
%         
%          
%     
%             end  
%     end
%     
% end
%     
% end
%     end
%     end
% 
%     end
%     end
%     end
%     end
%     end
% end
% 
% % 
% h1=guidata (handles.s1); %save it in h1
%   h1.prev=hObject; %load this gui when back 
%   guidata(handles.s1,h1); %load values when pressing 
%   guidata (hObject, handles);
%    set(handles.s1,'visible','off'); %hide second when this gui is opened
% % % 
% % % % Choose default command line output for sec
%   handles.output = hObject;
% % % 
% % % % Update handles structure 
%   guidata(hObject, handles);
% 
% % UIWAIT makes sec wait for user response (see UIRESUME)
% --- Outputs from this function are returned to the command line.
function varargout = sec_OutputFcn(hObject, eventdata, handles) 
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
close;
upsampling;




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global x;
% x=2;
%  handles.s1=resamplingupp;
%  set(handles.output,'visible','off');
%  set(handles.s1,'visible','on');
 
 close;
 resamplingupp;



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global x;
% x=3;
%  handles.s1=Negative_img; 
% 
% set(handles.output,'visible','off');
% set(handles.s1,'visible','on');

close;
Negative_img;



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Power_Low;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global x;
% x=5;
%  handles.s1=Log;  
% set(handles.output,'visible','off');
% set(handles.s1,'visible','on');
close;
Log;




% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
cotrast;

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global x;
% x=7;
% handles.s1=greylevel;
% set(handles.output,'visible','off');
% set(handles.s1,'visible','on');
close;
greylevel;


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global x;
% x=8;
%  handles.s1=thresholdapp;
% set(handles.output,'visible','off');
% set(handles.s1,'visible','on');
close;
thresholdapp;

 

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global x;
% x=9;
%   handles.s1=firstapp;
% set(handles.output,'visible','off');
% set(handles.s1,'visible','on');
close;
firstapp;





% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
grayLevel_2ndApproch;



% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global x;
% x=11;
%   handles.s1=BitGraySlicing;
%   
% set(handles.output,'visible','off');
% set(handles.s1,'visible','on');
close;
BitGraySlicing;



% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global x;
% x=12;
%  handles.s1=add;
% set(handles.output,'visible','off');
% set(handles.s1,'visible','on');
%  
% close;
% open('add.fig');
% 
% 
close;
add;

% --- Executes on button press in pushbutton13.

function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global x;
% x=13;
%  handles.s1=subtract_num_from_imgfig;  
% set(handles.output,'visible','off');
% set(handles.s1,'visible','on');
close;
subtract_num_from_imgfig;



% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global x;
% x=14;
% 
%  handles.s1=untitled1; 
%  set(handles.output,'visible','off');
% set(handles.s1,'visible','on');

 close;
untitled1;




% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles.prev=project;  
% set(handles.prev,'visible','on');
% set(handles.output,'visible','off');
close;
open('project.fig');

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global x;
% x=19;
%  handles.s1=Histogram; 
% set(handles.output,'visible','off');
% set(handles.s1,'visible','on');
close;
Histogram;




% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global x;
% x=20;
%  handles.s1=hisogram_E; 
% set(handles.output,'visible','off');
% set(handles.s1,'visible','on');
close;
hisogram_E;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
ha = axes('units','normalized', ...
            'position',[0 0 1 1]);
% Move the background axes to the bottom
uistack(ha,'bottom');
% Load in a background image and display it using the correct colors
% The image used below, is in the Image Processing Toolbox.  If you do not have %access to this toolbox, you can use another image file instead.
I=imread('back.jpg');
hi = imagesc(I)
colormap gray
% Turn the handlevisibility off so that we don't inadvertently plot into the axes again
% Also, make the axes invisible
set(ha,'handlevisibility','off', ...
            'visible','off')
% Now we can use the figure, as required.
% For example, we can put a plot in an axes
axes('position',[0,0,0,0])
plot(rand(10))


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Power_Low;


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
