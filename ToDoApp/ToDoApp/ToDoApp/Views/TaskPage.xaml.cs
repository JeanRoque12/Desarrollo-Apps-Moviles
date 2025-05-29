using System;
using Xamarin.Forms;
using ToDoApp.Models;
using ToDoApp.Services;

namespace ToDoApp.Views
{
    public partial class TaskPage : ContentPage
    {
        private readonly TaskDatabase _database = new TaskDatabase();
        private TaskItem _task;

        public TaskPage(TaskItem task)
        {
            InitializeComponent();
            _task = task ?? new TaskItem();
            nameEntry.Text = _task.Name;
            descriptionEditor.Text = _task.Description;
            deleteButton.IsVisible = _task.Id != 0;
        }

        private async void OnSaveClicked(object sender, EventArgs e)
        {
            _task.Name = nameEntry.Text;
            _task.Description = descriptionEditor.Text;
            await _database.SaveTaskAsync(_task);
            await Navigation.PopAsync();
        }

        private async void OnDeleteClicked(object sender, EventArgs e)
        {
            await _database.DeleteTaskAsync(_task);
            await Navigation.PopAsync();
        }
    }
}
