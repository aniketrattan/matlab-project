%% PROJECT STAGE 1

% The first bug of this program was discovered at this stage. I found out
% that the function thats required to pull the atomic elements is working
% fine but its not getting the correct inputs.

% Due to that, the output was very wierd and had to be looked upon.

%%

classdef project_stage1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                 matlab.ui.Figure
        EditField                matlab.ui.control.EditField
        UITable                  matlab.ui.control.Table
        GoButton                 matlab.ui.control.Button
        PleaseEnterDropDown      matlab.ui.control.DropDown
        PleaseEnterLabel         matlab.ui.control.Label
        ThisprogramletsyouLabel  matlab.ui.control.Label
    end

    
    properties (Access = private)
        
        % Initializing atomicNumber to store the atomic numbers.
        atomicNumber = [1:118];
         
        % Initializing atomicSymbols to store the atomic symbols.
        atomicSymbols = [
            "H", "He", "Li", "Be", "B", "C", "N", "O", "F", "Ne", "Na", "Mg", "Al", "Si", "P", ...
            "S", "Cl", "Ar", "K", "Ca", "Sc", "Ti", "V", "Cr", "Mn", "Fe", "Co", "Ni", "Cu", ...
            "Zn", "Ga", "Ge", "As", "Se", "Br", "Kr", "Rb", "Sr", "Y", "Zr", "Nb", "Mo", "Tc", ...
            "Ru", "Rh", "Pd", "Ag", "Cd", "In", "Sn", "Sb", "Te", "I", "Xe", "Cs", "Ba", "La", ...
            "Ce", "Pr", "Nd", "Pm", "Sm", "Eu", "Gd", "Tb", "Dy", "Ho", "Er", "Tm", "Yb", "Lu", ...
            "Hf", "Ta", "W", "Re", "Os", "Ir", "Pt", "Au", "Hg", "Tl", "Pb", "Bi", "Po", "At", ...
            "Rn", "Fr", "Ra", "Ac", "Th", "Pa", "U", "Np", "Pu", "Am", "Cm", "Bk", "Cf", "Es", ...
            "Fm", "Md", "No", "Lr", "Rf", "Db", "Sg", "Bh", "Hs", "Mt", "Ds", "Rg", "Cn", "Nh", ...
            "Fl", "Mc", "Lv", "Ts", "Og"
        ];
        
        % Initializing atomicElements to store the names of all atomic elements.
        atomicElements = [
    "Hydrogen", "Helium", "Lithium", "Beryllium", "Boron", "Carbon", ...
    "Nitrogen", "Oxygen", "Fluorine", "Neon", "Sodium", "Magnesium", ...
    "Aluminum", "Silicon", "Phosphorus", "Sulfur", "Chlorine", "Argon", ...
    "Potassium", "Calcium", "Scandium", "Titanium", "Vanadium", "Chromium", ...
    "Manganese", "Iron", "Cobalt", "Nickel", "Copper", "Zinc", "Gallium", ...
    "Germanium", "Arsenic", "Selenium", "Bromine", "Krypton", "Rubidium", ...
    "Strontium", "Yttrium", "Zirconium", "Niobium", "Molybdenum", "Technetium", ...
    "Ruthenium", "Rhodium", "Palladium", "Silver", "Cadmium", "Indium", "Tin", ...
    "Antimony", "Tellurium", "Iodine", "Xenon", "Cesium", "Barium", "Lanthanum", ...
    "Cerium", "Praseodymium", "Neodymium", "Promethium", "Samarium", "Europium", ...
    "Gadolinium", "Terbium", "Dysprosium", "Holmium", "Erbium", "Thulium", ...
    "Ytterbium", "Lutetium", "Hafnium", "Tantalum", "Tungsten", "Rhenium", ...
    "Osmium", "Iridium", "Platinum", "Gold", "Mercury", "Thallium", "Lead", ...
    "Bismuth", "Polonium", "Astatine", "Radon", "Francium", "Radium", "Actinium", ...
    "Thorium", "Protactinium", "Uranium", "Neptunium", "Plutonium", "Americium", ...
    "Curium", "Berkelium", "Californium", "Einsteinium", "Fermium", ...
    "Mendelevium", "Nobelium", "Lawrencium", "Rutherfordium", "Dubnium", ...
    "Seaborgium", "Bohrium", "Hassium", "Meitnerium", "Darmstadtium", ...
    "Roentgenium", "Copernicium", "Nihonium", "Flerovium", "Moscovium", ...
    "Livermorium", "Tennessine", "Oganesson"
    ];
    end

    methods (Access = private)
        
        % Function to provide a lookup which returns the corresponding 
        % atomic symbol and atomic name when atomic number is provided
        function [entry] = atomNum(app,value)
            entry = [app.atomicNumber(value), app.atomicSymbols(value), app.atomicElements(value)];
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: GoButton
        function GoButtonPushed(app, event)
            value = app.EditField.Value;

            % if statement for pulling the appropriate function according
            % to the dropdown option choosed.
            if strcmp (app.PleaseEnterDropDown.Value, "Atomic Number")
                app.UITable.Data = atomNum(app,value);
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create ThisprogramletsyouLabel
            app.ThisprogramletsyouLabel = uilabel(app.UIFigure);
            app.ThisprogramletsyouLabel.BackgroundColor = [0.651 0.651 0.651];
            app.ThisprogramletsyouLabel.HorizontalAlignment = 'center';
            app.ThisprogramletsyouLabel.FontSize = 16.5;
            app.ThisprogramletsyouLabel.FontWeight = 'bold';
            app.ThisprogramletsyouLabel.Position = [1 374 640 106];
            app.ThisprogramletsyouLabel.Text = 'This program lets you go through the atomic elements of the periodic table. ';

            % Create PleaseEnterLabel
            app.PleaseEnterLabel = uilabel(app.UIFigure);
            app.PleaseEnterLabel.HorizontalAlignment = 'right';
            app.PleaseEnterLabel.Position = [140 322 77 22];
            app.PleaseEnterLabel.Text = 'Please Enter:';

            % Create PleaseEnterDropDown
            app.PleaseEnterDropDown = uidropdown(app.UIFigure);
            app.PleaseEnterDropDown.Items = {'Atomic Number', 'Atomic Symbol', 'Atomic Name'};
            app.PleaseEnterDropDown.Position = [232 319 229 28];
            app.PleaseEnterDropDown.Value = 'Atomic Number';

            % Create GoButton
            app.GoButton = uibutton(app.UIFigure, 'push');
            app.GoButton.ButtonPushedFcn = createCallbackFcn(app, @GoButtonPushed, true);
            app.GoButton.Position = [431 265 31 23];
            app.GoButton.Text = 'Go';

            % Create UITable
            app.UITable = uitable(app.UIFigure);
            app.UITable.ColumnName = {'Atomic Number'; 'Atomic Symbol'; 'Atomic Name'};
            app.UITable.RowName = {};
            app.UITable.Position = [164 57 314 150];

            % Create EditField
            app.EditField = uieditfield(app.UIFigure, 'text');
            app.EditField.InputType = 'alphanumerics';
            app.EditField.Position = [166 262 250 27];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = project_stage1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end