class CfgFunctions {
    class ADDON {
        class actions {
            file = FUNCFILE(actions);

            class addAction {};
            class removeAction {};
        };

        class common {
            file = FUNCFILE(common);

            class colorArrayToString {};
            class colorStringToArray {};
            class isFriend {};
            class hasTracker{};
            class preInit { preInit = 1; };
            class postInit { postInit = 1; };
        };

        class dialog {
            file = FUNCFILE(dialog);

            class ctrlAction {};

            class initButton {};
            class initContainer {};
            class initLabel {};
            class initMainControl {};
            class initTextBox {};
        };

        class xeh {
            file = FUNCFILE(xeh);

            class xeh_handlePut {};
            class xeh_handleTake {};
        };
    };
};
