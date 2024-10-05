function varargout = Histogram(varargin)
% HISTOGRAM MATLAB code for Histogram.fig
%      HISTOGRAM, by itself, creates a new HISTOGRAM or raises the existing
%      singleton*.
%
%      H = HISTOGRAM returns the handle to a new HISTOGRAM or the handle to
%      the existing singleton*.
%
%      HISTOGRAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HISTOGRAM.M with the given input arguments.
%
%      HISTOGRAM('Property','Value',...) creates a new HISTOGRAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Histogram_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Histogram_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Histogram

% Last Modified by GUIDE v2.5 17-May-2022 18:53:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Histogram_OpeningFcn, ...
                   'gui_OutputFcn',  @Histogram_OutputFcn, ...
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


% --- Executes just before Histogram is made visible.
function Histogram_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Histogram (see VARARGIN)

% Choose default command line output for Histogram
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Histogram wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Histogram_OutputFcn(hObject, eventdata, handles) 
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
% for user to choose image from his pc by browsing
[filename pathname]=uigetfile({'*.jpg';'*.png'},'File Selector');
global image
image=strcat(pathname,filename);
axes(handles.axes1);
imshow(image);

global original
original=imread(image);
[rows,columns,matrixno]=size(original);

%check if is RGB image
if size(image,3)==3
    original=rgb2gray(image);
end

% counts
h=zeros(1,256);
%"gray levels" of the image on the x-axis 
n=0:255;
for i=1:rows
    for j=1:columns
        z= original(i,j);
        h(z+1)=h(z+1)+1;
    end
end
% show the histogram of the image in axes2
axes(handles.axes2);
 bar(n,h,'BarWidth',1,'FaceColor','b');



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(handles.prev,'visible','on');
% set(handles.output,'visible','off');
close;
open('sec.fig');


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
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


% --- Executes on button press in pushbutton4.
