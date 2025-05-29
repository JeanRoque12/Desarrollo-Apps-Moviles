using System;
using Xamarin.Forms;
using ToDoApp.Models;
using ToDoApp.Services;

namespace ToDoApp.Views
{
    public partial class MainPage : ContentPage
    {
        private readonly TaskDatabase _database = new TaskDatabase();

        public MainPage()
        {
            InitializeComponent();
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();
            taskListView.ItemsSource = await _database.GetTasksAsync();
        }

        private async void OnAddTaskClicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new TaskPage(null));
        }

        private async void OnTaskSelected(object sender, SelectedItemChangedEventArgs e)
        {
            if (e.SelectedItem is TaskItem task)
            {
                await Navigation.PushAsync(new TaskPage(task));
            }
        }
    }
}
