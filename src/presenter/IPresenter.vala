using Gee;

namespace io.github.jorchube.vest
{
    public interface IPresenter : Object
    {
        public abstract void present(Gee.List<Suite> suites);
    }
}